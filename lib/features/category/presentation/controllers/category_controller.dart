import 'package:fundro_app/features/category/domain/models/category_model.dart';
import 'package:fundro_app/features/category/domain/services/category_service_interface.dart';
import 'package:get/get.dart' hide Response;

class CategoryController extends GetxController implements GetxService {
  final CategoryServiceInterface _categoryServiceInterface;

  CategoryController({
    required CategoryServiceInterface categoryServiceInterface,
  }) : _categoryServiceInterface = categoryServiceInterface;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  Future<void> getCategories() async {
    _isLoading = true;
    update();
    await _categoryServiceInterface.getCategories().then((value) {
      _categories = value;
    });
    _isLoading = false;
    update();
  }
}
