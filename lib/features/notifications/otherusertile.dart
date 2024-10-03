import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/images/t_circular_image.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class OtherUserProfileTile extends StatelessWidget {
  const OtherUserProfileTile({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subtitle,
    this.height = 72.0, // Default height for ListTile
  });

  final VoidCallback onPressed;
  final String title;
  final String subtitle;
  final double height; // New height parameter

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      height: height, // Use the height parameter here
      child: ListTile(
        onTap: onPressed,
        leading: const TCircularImage(
          image: TImages.user,
          width: 50,
          height: 50,
          padding: 0,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // Semi Bold
            color: dark ? TColors.white : TColors.black,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600, // Semi Bold
            color: dark ? TColors.lightGrey : TColors.darkGrey,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
