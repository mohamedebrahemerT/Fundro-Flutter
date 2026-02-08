import 'package:fundro_app/features/search/presentation/controllers/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_debouncer/flutter_debouncer.dart';
import 'package:get/get.dart';
import 'package:fundro_app/features/search/presentation/widgets/item_search_card.dart';
import 'package:fundro_app/features/search/presentation/widgets/store_search_card.dart';

class SearchScreen extends SearchDelegate {
  final Debouncer _debouncer = Debouncer();

  SearchScreen() : super(
    searchFieldLabel: 'search'.tr,
    textInputAction: TextInputAction.search,
  );

  Future<void> _searchApi(String query,CustomSearchController searchController) async {
    if (query.isEmpty) {
      return;
    }
    searchController.getItems(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    _debouncer.debounce(
      duration: const Duration(milliseconds: 500),
      onDebounce: () {
        _searchApi(query,Get.find<CustomSearchController>());
      },
    );

    return buildResults(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<CustomSearchController>(builder: (searchController) {
        if (query.isEmpty) {
          return Center(child: Text('search_for_any_shop'.tr));
        }
        if (searchController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final items =  [];
        final stores =  [];

        return Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'products'.tr),
                Tab(text: 'stores'.tr),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Products Tab
                  if (items.isEmpty)
                    Center(child: Text('not_found_items'.tr))
                  else
                    GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, index) {

                        // final ItemModel item = items[index];
                        // return ItemSearchCard(item: item);
                      },
                    ),

                  // Stores Tab
                  if (stores.isEmpty)
                    Center(child: Text('there_is_no_stores'.tr))
                  // else
                  //   ListView.builder(
                  //     padding: const EdgeInsets.all(8.0),
                  //     itemCount: stores.length,
                  //     itemBuilder: (context, index) {
                  //       final store = stores[index];
                  //       return StoreSearchCard(store: store);
                  //     },
                  //   ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}


