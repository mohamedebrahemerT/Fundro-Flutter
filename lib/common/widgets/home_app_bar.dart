import 'package:fundro_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:fundro_app/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fundro_app/common/widgets/custom_search_field.dart';
import 'package:fundro_app/core/utils/dimensions.dart';
import 'package:fundro_app/core/utils/styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Color? backgroundColor;

  const HomeAppBar({
    super.key,
    required this.searchController,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Dimensions.height * 0.08,
      automaticallyImplyLeading: false,
      actions: [],
      // backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("brands_deals".tr, style: cairoRegular),
              Spacer(),
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
              IconButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
                icon: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),

          // SizedBox(height: Dimensions.height * 0.01),

          // CustomSearchField(
          //   hintText: ["search_for_any_product".tr],
          //   controller: searchController,
          //   width: Dimensions.width * 0.9,
          //   height: Dimensions.height * 0.045,
          //   contentPadding: EdgeInsets.symmetric(
          //     horizontal: Dimensions.paddingSizeSmall,
          //   ),
          //   borderRadius: Dimensions.radiusDefault,
          //   fillColor: Theme.of(context).cardColor,
          //   borderColor: Theme.of(context).hintColor,
          //   hintColor: Colors.black,
          //   iconColor: Colors.black,
          // ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Dimensions.height * 0.08);
}
