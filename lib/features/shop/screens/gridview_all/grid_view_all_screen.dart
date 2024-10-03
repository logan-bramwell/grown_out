import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../models/product_model.dart';
import '../widgets/home_appbar.dart';

class GridViewAllScreen extends StatelessWidget {
  const GridViewAllScreen({super.key, required this.product});

  final ProductModel product;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                  /// -- Appbar --
                  THomeAppBar(),

                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: TSizes.defaultSpace, right: TSizes.defaultSpace, left: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Grid Layout
                  TGridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) => TProductCardVertical(product: product),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

