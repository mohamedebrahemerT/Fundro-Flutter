import 'package:fundro_app/features/products/domain/models/product_model.dart';
import 'package:fundro_app/features/products/domain/repositories/product_repository_interface.dart';
import 'package:fundro_app/features/products/domain/services/product_service_interface.dart';

class ProductServiceImpl implements ProductServiceInterface {
  final ProductRepositoryInterface productRepositoryInterface;
  ProductServiceImpl({required this.productRepositoryInterface});

  @override
  Future<List<ProductModel>> getProducts() async {
    return await productRepositoryInterface.getProducts();
  }

  @override
  Future<ProductModel?> getProductById(int productId) async {
    return await productRepositoryInterface.getProductById(productId);
  }
}
