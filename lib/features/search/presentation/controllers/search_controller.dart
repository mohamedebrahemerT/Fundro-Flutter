import 'package:get/get.dart' hide  Response;
import 'package:fundro_app/features/search/domain/models/search_model.dart';
import 'package:fundro_app/features/search/domain/services/search_service_interface.dart';


class CustomSearchController extends GetxController implements GetxService {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final SearchServiceInterface _searchServiceInterface;

  CustomSearchController({required SearchServiceInterface searchServiceInterface})
      : _searchServiceInterface = searchServiceInterface;

  // Future<void> getItems(String query) async {
  //   _isLoading = true;
  //   update();
  //   _items = await _searchServiceInterface.getItems(query)??[];
  //   _isLoading = false;
  //   update();
  // }
  SearchModel? _searchModel;
  SearchModel? get searchModel => _searchModel;

  Future<void> getItems(String query) async {
    _isLoading = true;
    update();
    _searchModel = await _searchServiceInterface.getSearchResult(query);
    _isLoading = false;
    update();
  }
}