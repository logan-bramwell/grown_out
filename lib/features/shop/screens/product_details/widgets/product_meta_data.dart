
import 'package:flutter/material.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/images/t_circular_image.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../controllers/product_controller.dart';
import '../../../models/product_model.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    return Align(
      alignment: Alignment.topLeft, // Align the content to the top left
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ensure everything is aligned to the start
        children: [
          Text(
            product.title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: dark ? TColors.white : TColors.black,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          TProductPriceText(
            price: product.price as String,
            isLarge: true,
            lineThrough: false,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
      ListTile(
        leading: const TCircularImage(
          image: TImages.user,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          product.user!.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          product.user!.fullName,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
      ),
          Text(
            product.description as String,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              color: dark ? TColors.white : TColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
