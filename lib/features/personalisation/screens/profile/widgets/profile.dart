import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/common/widgets/appbar/appbar.dart';
import 'package:whs_deals_app/common/widgets/images/t_circular_image.dart';
import 'package:whs_deals_app/common/widgets/texts/section_heading.dart';
import 'package:whs_deals_app/features/personalisation/controllers/user_controller.dart';
import 'package:whs_deals_app/features/personalisation/screens/profile/profile_menu.dart';
import 'package:whs_deals_app/utils/constants/image_strings.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';

import '../../../../../common/widgets/shimmers/shimmer.dart';
import 'change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                        return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80,)
                          : TCircularImage(image: image, height: 80, width: 80, isNetworkImage: networkImage.isNotEmpty,);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture'),),
                  ],
                ),
              ),
              /// details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              ///TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              ///TProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),


              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
