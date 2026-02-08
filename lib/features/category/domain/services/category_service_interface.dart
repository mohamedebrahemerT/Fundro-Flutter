import 'package:fundro_app/features/category/domain/models/category_model.dart';

abstract class CategoryServiceInterface {
  Future<List<CategoryModel>> getCategories();
}
