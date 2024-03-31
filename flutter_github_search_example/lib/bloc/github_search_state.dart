import 'package:equatable/equatable.dart';
import '../model/search_result_item.dart';

sealed class GithubSearchState extends Equatable {
  const GithubSearchState();

  @override
  List<Object> get props => [];
}

// GithubSearchStateクラスから継承されたデフォルトのコンストラクタを使用
// SearchStateEmptyクラスには状態を表す追加のプロパティやメソッドがない場合、追加のコンストラクタを定義する必要はありません。
final class SearchStateEmpty extends GithubSearchState {}

final class SearchStateLoading extends GithubSearchState {}

final class SearchStateSuccess extends GithubSearchState {
  const SearchStateSuccess(this.items);

  final List<SearchResultItem> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

final class SearchStateError extends GithubSearchState {
  const SearchStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
