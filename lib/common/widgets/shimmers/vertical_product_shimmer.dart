import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/shimmers/shimmer.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder shimmer effect
            TShimmerEffect(width: 180, height: 180),
            SizedBox(height: TSizes.spaceBtwItems),

            // Text placeholder shimmer effects
            TShimmerEffect(width: 160, height: 15),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            TShimmerEffect(width: 110, height: 15),
          ],
        ), // Column
      ), // SizedBox
    ); // TGridLayout
  }
}
