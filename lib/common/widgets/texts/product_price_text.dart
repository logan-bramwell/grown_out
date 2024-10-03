import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '\$',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign;
  final String price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);


    return Text(
      '$currencySign$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: dark ? TColors.white : TColors.black,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
      )
          : TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: dark ? TColors.white : TColors.black,
        decoration: lineThrough ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
