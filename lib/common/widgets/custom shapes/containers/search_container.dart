import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.isRefineButton = false, // New parameter to check if it's a Refine button
    this.textSize = 14, // Default text size
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder, isRefineButton;
  final double textSize; // Text size parameter

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? (dark ? TColors.dark : TColors.light) : Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: TColors.grey) : null,
        ),
        child: isRefineButton
            ? Center( // Center the text if it's a refine button
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: textSize, // Apply the custom text size
            ),
          ),
        )
            : Row( // Original layout for search bar with icon
          children: [
            Icon(icon, color: TColors.grey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: textSize, // Apply the custom text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
