import 'package:fundro_app/features/search/domain/models/search_model.dart';

abstract class SearchRepoInterface {
    Future<SearchModel?> getSearchResult(String query);

}