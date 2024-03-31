import 'package:equatable/equatable.dart';
import '../model/drink.dart';

sealed class ThecocktaildbSearchState extends Equatable {
  const ThecocktaildbSearchState();

  @override
  List<Object> get props => [];
}

// GithubSearchStateクラスから継承されたデフォルトのコンストラクタを使用
// SearchStateEmptyクラスには状態を表す追加のプロパティやメソッドがない場合、追加のコンストラクタを定義する必要はありません。
final class SearchStateEmpty extends ThecocktaildbSearchState {}

final class SearchStateLoading extends ThecocktaildbSearchState {}

final class SearchStateSuccess extends ThecocktaildbSearchState {
  final List<Drink> items;

  const SearchStateSuccess(this.items);

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'SearchStateSuccess { items: ${items.length} }';
}

final class SearchStateError extends ThecocktaildbSearchState {
  final String error;

  const SearchStateError(this.error);

  @override
  List<Object> get props => [error];
}
