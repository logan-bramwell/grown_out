import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/images/t_rounded_image.dart';
import 'package:whs_deals_app/common/widgets/texts/product_title_text.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/product_detail.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/image_strings.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../styles/shadows.dart';
import '../../custom shapes/containers/rounded_container.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product,)),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow], // remove to get rid of shadow
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.lightContainer,
        ),
        child: Row(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 120,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: const TRoundedImage(
                imageUrl: TImages.whiteTShirt,
                applyImageRadius: true,
              ),
            ),

            /// Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: TSizes.sm,
                  left: TSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TProductTitleText(
                      title: 'Mens T-Shirt',
                      smallSize: true,
                    ),
                    Text(
                      'Frankton - 2h',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(height: TSizes.spaceBtwHeader),
                    Text(
                      'Size 50',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Price
                        Text(
                          '\$30',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),

                        /// Icon or button area (if needed)
                        Container(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.productImageRadius),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
