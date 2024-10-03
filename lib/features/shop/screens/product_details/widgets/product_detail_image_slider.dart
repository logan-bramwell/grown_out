import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/curved_edges/curved_edges_widget.dart';
import 'package:whs_deals_app/features/shop/models/product_model.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/appbar/product_screen_appbar.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/images_controller.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return TCurvedEdgesWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // AspectRatio widget to maintain the 3:4 aspect ratio
            AspectRatio(
              aspectRatio: 3 / 4, // 3:4 aspect ratio
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0, // Full width of the container
                  aspectRatio: 3 / 4, // Match the aspect ratio
                  autoPlay: false,
                ),
                items: [
                  // Add images here
                  Center(
                    child: Obx(
                      () {
                        final image = controller.selectedProductImage.value;
                        return GestureDetector(
                          onTap: () => controller.showEnlargedImage(image),
                          child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover, progressIndicatorBuilder: (_, __, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress, color: TColors.primary,)),
                        );
                        },

                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(
                        color: imageSelected ? TColors.primary : Colors.transparent,
                      ),
                    );
                  }),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(TSizes.spaceBtwItems),
              child: ProductScreenAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
