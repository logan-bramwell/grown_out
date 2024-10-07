import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/images/t_rounded_image.dart';
import 'package:whs_deals_app/common/widgets/texts/product_title_text.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/product_detail.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../styles/shadows.dart';
import '../../custom shapes/containers/rounded_container.dart';


class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
          width: 180,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white,
          ),
          child: Column(
            children: [

              /// thumbnail
              TRoundedContainer(
                height: 180,
                  width: 180,
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  child: Stack(
                    children: [
                      ///thumbnail image
                      Center(child: TRoundedImage(imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true,)),
                      const SizedBox(height: TSizes.spaceBtwItems /2),

                    ],
                  )
              ),

              /// - details
              Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(product.title, overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelSmall),
                            const Spacer(),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6,),
                              child: Text('Size 50', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelSmall),
                            ),
                            /// add user details using product.user!

                            ///can add icon or text to the right of this text since its a row
                            ///
                          ],
                        ),
                        const TProductTitleText(title: 'Mens T-Shirt', smallSize: true),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///price
                            Text(
                              product.price as String,
                              maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: TColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(TSizes.productImageRadius),
                                ),
                              ),
                                ///child: const SizedBox(
                                  ///width: TSizes.iconLg * 1.2,
                                  ///height: TSizes.iconLg * 1.2,
                                    ///child: Center(child: Icon(Iconsax.add, color: TColors.white,))
                                ///)

                            )
                          ],
                        )

                      ]
                  )
              )

            ],
          )
      ),
    );
  }
}
