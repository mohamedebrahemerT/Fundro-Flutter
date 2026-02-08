
class SearchModel {
  final int totalCount;
  // final List<ItemModel> items;
  // final List<StoreModel> stores;

  SearchModel({
    required this.totalCount,
    // required this.stores,
    // required this.items,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      totalCount: json['total_count'] ?? 0,
      // items:
      //     (json['results']['items']['data'] as List<dynamic>?)
      //         ?.map((item) => ItemModel.fromJson(item))
      //         .toList() ??
      //     [],
      // stores:
      //     (json['results']['restaurants']['data'] as List<dynamic>?)
      //         ?.map((store) => StoreModel.fromJson(store))
      //         .toList() ??
      //     [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      // 'items': items.map((item) => item.toJson()).toList(),
      // 'stores': stores.map((store) => store.toJson()).toList(),
    };
  }
}
