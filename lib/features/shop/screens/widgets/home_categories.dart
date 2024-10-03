import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:whs_deals_app/common/widgets/shimmers/category_shimmer.dart';
import 'package:whs_deals_app/features/shop/screens/sub_category/sub_categories.dart';
import '../../controllers/category_controller.dart';
import '../../models/product_model.dart';



class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      }
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(product: product,)),
              );
            },
          ),
        ),
      );
    });
  }
}