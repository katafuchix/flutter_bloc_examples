import 'drink.dart';

class SearchResult {
  final List<Drink> drinks;

  const SearchResult({required this.drinks});

  // https://www.thecocktaildb.com/api/json/v1/1/search.php?s=a
  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final items = (json['drinks'] as List<dynamic>)
        .map(
          (dynamic item) =>
          Drink.fromJson(item as Map<String, dynamic>),
    )
        .toList();
    return SearchResult(drinks: items);
  }
}
