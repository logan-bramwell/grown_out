import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/device/device_utility.dart';

import '../../../utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,

  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override

  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm, top: TSizes.spaceBtwItems),
      child: AppBar(
        iconTheme: IconThemeData(color: dark ? TColors.light : TColors.dark,),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: showBackArrow
            ? IconButton(
            onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null
            ? IconButton(
            onPressed: leadingOnPressed, icon: const Icon(Iconsax.arrow_left))
            : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
