import 'package:flutter/material.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';

import '../../../utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  /// A custom Circular Icon widget with a background color.
  ///
  /// Properties are:
  /// Container [width], [height], [backgroundColor], and [borderRadius].
  ///
  /// Icon's [icon], [size], [color], and [onPressed].
  const TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.borderRadius = 100.0,
  });

  final double? width, height, size, borderRadius;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context)
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color, size: size),
        ),
      ),
    );
  }
}
