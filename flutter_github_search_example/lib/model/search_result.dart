import 'search_result_item.dart';

class SearchResult {
  const SearchResult({required this.items});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map(
          (dynamic item) =>
          SearchResultItem.fromJson(item as Map<String, dynamic>),
    )
        .toList();
    return SearchResult(items: items);
  }

  final List<SearchResultItem> items;
}
