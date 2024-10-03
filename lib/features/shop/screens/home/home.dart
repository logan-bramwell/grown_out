
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/product_detail.dart';
import 'package:whs_deals_app/features/shop/screens/widgets/home_appbar.dart';
import 'package:whs_deals_app/features/shop/screens/widgets/home_categories.dart';
import '../../../../common/widgets/custom shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';
import '../all_products/all_products.dart';
import '../widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => ProductDetailScreen(product: product)),
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                children: [
                  /// -- Appbar --
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwHeader),
                  const TSearchContainer(text: 'Search for an item...'),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories --
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// -- Heading --
                        const TSectionHeading(
                          title: 'Categories',
                          showActionButton: false,
                          textColor: Colors.white, // Set text color to white
                        ),
                        const SizedBox(height: TSizes.spaceBtwHeader),

                        /// -- Categories --
                        THomeCategories(product: product,),
                        const SizedBox(height: TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Section Heading and Recently Listed Grid
                  TSectionHeading(
                    title: 'Recently Listed...',
                    showActionButton: true,
                    buttonTitle: "View All",
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllProducts(
                          product: product,
                          title: 'Recent Products',
                          futureMethod: controller.fetchAllRecentProducts(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Recently Listed Grid Layout
                  Obx(() {
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.recentProducts.isEmpty) {
                      return Center(child: Text("No products found", style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                        itemCount: controller.recentProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.recentProducts[index])
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


