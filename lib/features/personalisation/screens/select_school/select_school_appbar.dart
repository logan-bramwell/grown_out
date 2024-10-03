import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/navigation_menu.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../shop/models/product_model.dart';

class SelectSchoolAppBar extends StatelessWidget {
  const SelectSchoolAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.to(NavigationMenu(product: ProductModel.empty()));
          },
          style: IconButton.styleFrom(
            backgroundColor: dark ? TColors.darkerGrey : Colors.white,
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
          "Find Your School",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // Semi Bold
            color: TColors.white,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        const SizedBox(width: 50)
      ],
    );
  }
}
