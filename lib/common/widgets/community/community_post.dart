import 'package:flutter/material.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom shapes/containers/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../features/personalisation/controllers/user_controller.dart';

class CommunityPost extends StatelessWidget {
  const CommunityPost({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = UserController.instance;

    return TRoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.light,
      borderColor: dark ? TColors.lightContainer : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15, // Adjust the radius for profile picture size
                backgroundImage: NetworkImage(controller.user.value.profilePicture), // Replace with actual profile picture URL
                // You can also use AssetImage('assets/path_to_image.png') if it's a local image
              ),
              const SizedBox(width: TSizes.sm),
              Expanded(
                child: Text(
                  controller.user.value.fullName, // Replace with the user's full name
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.sm),
          Text(
            'I am looking for a size 34 men\'s shirt', // The statement
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: TSizes.sm),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("I have this item"),
            ),
          ),
        ],
      ),
    );
  }
}
