import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.newListingButton,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // Sub-Categories
              Column(
                children: [
                  TSectionHeading(title: 'Sports Shirts', onPressed: (){}),
                  const SizedBox(height: TSizes.spaceBtwHeader),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                        itemBuilder: (context, index) => TProductCardHorizontal(product: product,)),
                  ),
                ],
              ),
              // Heading
               // Ensure title is a string
            ],
          ),
        ),
      ),
    );
  }
}
