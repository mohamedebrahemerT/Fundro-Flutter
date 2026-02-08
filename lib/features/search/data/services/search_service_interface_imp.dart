import 'package:fundro_app/features/search/domain/models/search_model.dart';
import 'package:fundro_app/features/search/domain/repositories/search_repo_interface.dart';
import 'package:fundro_app/features/search/domain/services/search_service_interface.dart';

class SearchServiceInterfaceImp implements SearchServiceInterface {
  final SearchRepoInterface _searchRepoInterface;

  SearchServiceInterfaceImp({required SearchRepoInterface searchRepoInterface})
    : _searchRepoInterface = searchRepoInterface;

  @override
  Future<SearchModel?> getSearchResult(String query) {
    return _searchRepoInterface.getSearchResult(query);
  }
}
