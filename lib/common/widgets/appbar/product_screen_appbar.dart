import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class ProductScreenAppBar extends StatelessWidget {
  const ProductScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      top: 40,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: IconButton.styleFrom(
              backgroundColor:
              dark ? TColors.darkerGrey : Colors.white,
              fixedSize: const Size(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            color: dark ? Colors.white : Colors.black,
            icon: const Icon(CupertinoIcons.chevron_back),
          ),
          const Spacer(),

          const SizedBox(width: TSizes.spaceBtwItems,),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor:
              dark ? TColors.darkerGrey : Colors.white,
              fixedSize: const Size(50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            color: dark ? Colors.white : Colors.black,
            icon: const Icon(CupertinoIcons.share),
          ),


        ],
      ),
    );
  }
}
