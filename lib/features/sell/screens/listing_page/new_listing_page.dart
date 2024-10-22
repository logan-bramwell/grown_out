import 'package:flutter/material.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/bottom_navigation_widget.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/breadcrumb_with_heading.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/product_type_widget.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/stock_pricing_widget.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/thumbnail_widget.dart';
import 'package:whs_deals_app/features/sell/screens/listing_page/widgets/title_description.dart';

import '../../../../common/widgets/custom shapes/containers/rounded_container.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/constants/sizes.dart';


class CreateProductMobileScreen extends StatelessWidget {
  const CreateProductMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProductImagesController());

    return Scaffold(
      bottomNavigationBar: const ProductBottomNavigationButtons(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumbs
              TBreadcrumbsWithHeading(
                  returnToPreviousScreen: true, heading: 'Create Product', breadcrumbItems: [TRoutes.home, 'Create Product']),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Create Product
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductTitleAndDescription(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Stock & Pricing
                  TRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Heading
                        Text('Stock & Pricing', style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Product Type
                        const ProductTypeWidget(),
                        const SizedBox(height: TSizes.spaceBtwInputFields),

                        // Stock
                        const ProductStockAndPricing(),
                        const SizedBox(height: TSizes.spaceBtwSections),

                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Sidebar
                  const ProductThumbnailImage(),
                  const SizedBox(height: TSizes.spaceBtwSections),
/*
                  // Product Images
                  TRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('All Product Images', style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        ProductAdditionalImages(
                          additionalProductImagesURLs: controller.additionalProductImagesUrls,
                          onTapToAddImages: () => controller.selectMultipleProductImages(),
                          onTapToRemoveImage: (index) => controller.removeImage(index),
                        ),
                      ],
                    ),
                  ),

 */

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
