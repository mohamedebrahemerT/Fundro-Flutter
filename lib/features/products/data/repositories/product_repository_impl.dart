import 'package:fundro_app/core/utils/app_constants.dart';
import 'package:fundro_app/features/products/domain/models/product_model.dart';
import 'package:fundro_app/features/products/domain/repositories/product_repository_interface.dart';
import 'package:fundro_app/core/api/api_client.dart';
import 'package:dio/dio.dart';

class ProductRepositoryImpl implements ProductRepositoryInterface {
  final ApiClient apiClient;
  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<List<ProductModel>> getProducts() async {
    Response res = await apiClient.getData(AppConstants.productsUrl);

    if (res.statusCode == 200 && res.data['success'] == true) {
      return (res.data['data'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<ProductModel?> getProductById(int productId) async {
    Response res = await apiClient.getData(
      '${AppConstants.productsUrl}/$productId',
    );

    if (res.statusCode == 200 && res.data['success'] == true) {
      return ProductModel.fromJson(res.data['data']);
    } else {
      return null;
    }
  }
}
