import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class GridViewAppBar extends StatelessWidget {
  const GridViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
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
        Text(
          "Recent Listings",
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium!
              .copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // Semi Bold
            color: TColors.white,
            fontSize: 22,

          ),

        ),
        const Spacer(),
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
          color: dark ? Colors.red : Colors.red,
          icon: const Icon(Iconsax.notification),
        ),




      ],
    );
  }
}
