import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/category/domain/models/category_model.dart';
import 'package:fundro_app/features/category/domain/repositories/category_repository_interface.dart';
import 'package:fundro_app/core/api/api_client.dart';
import 'package:dio/dio.dart';

class CategoryRepositoryImpl implements CategoryRepositoryInterface {
  final ApiClient apiClient;
  CategoryRepositoryImpl({required this.apiClient});

  @override
  Future<List<CategoryModel>> getCategories() async {
    Response res = await apiClient.getData(AppConstants.categoryUrl);

    if (res.statusCode == 200 && res.data['success'] == true) {
      return (res.data['data'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
