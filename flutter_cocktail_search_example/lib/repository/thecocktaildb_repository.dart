import './thecocktaildb_cache.dart';
import './thecocktaildb_client.dart';
import '../model/search_result.dart';

class ThecocktaildbRepository {
  const ThecocktaildbRepository(this.cache, this.client);

  final ThecocktaildbCache cache;
  final ThecocktaildbClient client;

  Future<SearchResult> search(String term) async {
    final cachedResult = cache.get(term);
    if (cachedResult != null) {
      return cachedResult;
    }
    final result = await client.search(term);
    cache.set(term, result);
    return result;
  }
}
