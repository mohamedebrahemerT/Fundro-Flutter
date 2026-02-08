import 'package:fundro_app/features/search/domain/models/search_model.dart';

abstract class SearchServiceInterface {
  Future<SearchModel?> getSearchResult(String query);
}
