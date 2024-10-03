import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Align(
      alignment: Alignment.centerLeft, // Align the column to the left
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
        children: [
          Image(
            height: 150,
            image: AssetImage(
              dark ? TImages.whsLogoNoText : TImages.whsLogoNoText,
            ),
          ),
          const SizedBox(height: TSizes.sm),
          Text(
            TTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: TSizes.sm),
          Text(
            TTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
