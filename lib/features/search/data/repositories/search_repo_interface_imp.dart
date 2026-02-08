import 'package:fundro_app/core/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/search/domain/models/search_model.dart';
import 'package:fundro_app/features/search/domain/repositories/search_repo_interface.dart';

class  SearchRepoInterfaceImp implements SearchRepoInterface {
  final ApiClient apiClient;

  SearchRepoInterfaceImp({required this.apiClient});



  @override
  Future<SearchModel?> getSearchResult(String query) async {
    Response res = await apiClient.getData('${AppConstants.searchUrl}$query&type=all');
    if (res.statusCode == 200 && res.data['status'] == true ) {
      return  SearchModel.fromJson(res.data);
    }
    return null;
  }

}

  
