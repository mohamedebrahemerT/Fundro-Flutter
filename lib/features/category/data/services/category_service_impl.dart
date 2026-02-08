import 'package:fundro_app/features/category/domain/models/category_model.dart';
import 'package:fundro_app/features/category/domain/repositories/category_repository_interface.dart';
import 'package:fundro_app/features/category/domain/services/category_service_interface.dart';

class CategoryServiceImpl implements CategoryServiceInterface {
  final CategoryRepositoryInterface categoryRepositoryInterface;
  CategoryServiceImpl({required this.categoryRepositoryInterface});

  @override
  Future<List<CategoryModel>> getCategories() async {
    return await categoryRepositoryInterface.getCategories();
  }
}
