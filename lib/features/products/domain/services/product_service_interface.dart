import 'package:fundro_app/features/products/domain/models/product_model.dart';

abstract class ProductServiceInterface {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel?> getProductById(int productId);
}
