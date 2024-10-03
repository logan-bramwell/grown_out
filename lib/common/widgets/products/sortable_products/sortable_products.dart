import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';
import 'package:whs_deals_app/features/shop/controllers/all_products_controller.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../appbar/appbar.dart';
import '../../custom shapes/containers/search_container.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        TPrimaryHeaderContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align text to the start
            children: [

              /// -- Appbar --
              TAppBar(title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                      'All Products',
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semi Bold
                        color: TColors.white,
                        fontSize: 22,)
                  ),
                ],
              ),
                showBackArrow: true,
              ),
              const SizedBox(height: TSizes.spaceBtwHeader),
              const TSearchContainer(text: 'Refine', isRefineButton: true, icon: Icons.list,),
              DropdownButtonFormField(
                items: ['Highest Price', 'Lowest Price', 'Newest', 'Oldest'].map((option) => DropdownMenuItem(value: option, child: Text(option))).toList(),
                  value: controller.selectedSortOption.value,
                  onChanged: (value) {
                  controller.sortProducts(value!);
                },

              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort))),
              const SizedBox(height: TSizes.spaceBtwSections * 1.2),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: TSizes.spaceBtwHeader,
            right: TSizes.defaultSpace,
            left: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Grid Layout
              Obx(
                () => TGridLayout(
                  itemCount: controller.products.length,
                  itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}