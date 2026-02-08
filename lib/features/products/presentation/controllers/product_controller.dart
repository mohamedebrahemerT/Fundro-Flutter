// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fundro_app/features/products/domain/models/product_model.dart';
import 'package:fundro_app/features/products/domain/services/product_service_interface.dart';
import 'package:get/get.dart' hide Response;
import 'package:fundro_app/features/auth/domain/models/signup_body_model.dart';
import 'package:fundro_app/features/auth/domain/services/auth_service_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController implements GetxService {
  final ProductServiceInterface _productServiceInterface;

  ProductController({required ProductServiceInterface productServiceInterface})
    : _productServiceInterface = productServiceInterface;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  bool _isLoadingDetails = false;
  bool get isLoadingDetails => _isLoadingDetails;
  ProductModel? _productDetails;
  ProductModel? get productDetails => _productDetails;

  Future<void> getProducts() async {
    _isLoading = true;
    update();
    await _productServiceInterface.getProducts().then((value) {
      _products = value;
    });
    _isLoading = false;
    update();
  }

  Future<void> getProductById(int productId) async {
    _isLoadingDetails = true;
    _productDetails = null;
    update();
    await _productServiceInterface.getProductById(productId).then((value) {
      _productDetails = value;
    });
    _isLoadingDetails = false;
    update();
  }
}
