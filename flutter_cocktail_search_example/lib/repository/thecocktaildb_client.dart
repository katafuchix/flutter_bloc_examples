import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/search_result.dart';
import '../model/search_result_error.dart';

class ThecocktaildbClient {
  ThecocktaildbClient({
    http.Client? httpClient,
    this.baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=',
  }) : httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final http.Client httpClient;

  Future<SearchResult> search(String term) async {
    final response = await httpClient.get(Uri.parse('$baseUrl$term'));
    final results = json.decode(response.body) as Map<String, dynamic>;

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}