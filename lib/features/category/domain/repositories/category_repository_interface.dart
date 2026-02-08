import 'package:fundro_app/features/category/domain/models/category_model.dart';

abstract class CategoryRepositoryInterface {
  Future<List<CategoryModel>> getCategories();
}
