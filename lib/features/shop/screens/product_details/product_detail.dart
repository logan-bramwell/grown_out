import 'package:flutter/material.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/widgets/location_share_widget.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:whs_deals_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';

import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(

            children: [
              /// -- Product Image Slider
              TProductImageSlider(product: product,),

              /// Product Details
              Padding(
                padding: const EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
                child: Column(
                  children: [
                    const TLocationAndShare(),
                    TProductMetaData(product: product),
                  ],
                ),
          ),
        ],
      ),
    ));
  }
}

