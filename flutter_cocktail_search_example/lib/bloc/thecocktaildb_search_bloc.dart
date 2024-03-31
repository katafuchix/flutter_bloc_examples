import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import './thecocktaildb_search_event.dart';
import './thecocktaildb_search_state.dart';
import '../model/search_result_error.dart';
import '../repository/thecocktaildb_repository.dart';

const _duration = Duration(milliseconds: 300);

// 与えられた時間間隔（duration）内に複数のイベントが発生した場合に、
// 最後のイベントのみを通知するイベントトランスフォーマーを定義しています。
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class ThecocktaildbSearchBloc extends Bloc<ThecocktaildbSearchEvent, ThecocktaildbSearchState> {
  final ThecocktaildbRepository thecocktaildbRepository;

  ThecocktaildbSearchBloc({required this.thecocktaildbRepository})
      : super(SearchStateEmpty()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  Future<void> _onTextChanged(
      TextChanged event,
      Emitter<ThecocktaildbSearchState> emit,
      ) async {
    final searchTerm = event.text;

    if (searchTerm.isEmpty) return emit(SearchStateEmpty());

    emit(SearchStateLoading());

    try {
      final results = await thecocktaildbRepository.search(searchTerm);
      emit(SearchStateSuccess(results.drinks));
    } catch (error) {
      emit(
        error is SearchResultError
            ? SearchStateError(error.message)
            : const SearchStateError('something went wrong'),
      );
    }
  }
}
