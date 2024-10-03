import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:whs_deals_app/common/widgets/appbar/appbar.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';
import 'package:whs_deals_app/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:whs_deals_app/common/widgets/texts/section_heading.dart';
import 'package:whs_deals_app/features/personalisation/screens/address/addresses.dart';
import 'package:whs_deals_app/features/personalisation/screens/custom_notifications/custom_notifications.dart';
import 'package:whs_deals_app/features/personalisation/screens/my%20listings/my_listings.dart';
import 'package:whs_deals_app/features/personalisation/screens/select_school/select_school.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import 'package:whs_deals_app/utils/theme/theme_provider.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../authentication/screens/login/login.dart';
import '../profile/widgets/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  TAppBar(
                    title: Text(
                      "Account",
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
                  ),
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(title: "Account Settings", showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(onTap: () => Get.to(() => const UserAddressScreen()), icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set pick-up address'),
                  TSettingsMenuTile(onTap: () => Get.to(() => const MyListingsScreen()), icon: Iconsax.bag_tick, title: 'My Listings', subTitle: 'Manage your listings'),
                  TSettingsMenuTile(onTap: () => Get.to(() => const WishListScreen()), icon: Iconsax.notification, title: 'My WishList', subTitle: 'Create a wishlist of what you want and you will get shown more of that item '),
                  TSettingsMenuTile(onTap: () => Get.to(() => const SelectSchoolScreen(firstTime: false,)),icon: Iconsax.building, title: 'Select School', subTitle: 'Change the school you see items for'),



                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ///const TSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),

                  Consumer<ThemeNotifier>(
                      builder: (context, ThemeNotifier notifier, child) {
                        return TSettingsMenuTile(
                          icon: notifier.isDarkMode ? Iconsax.moon : Iconsax.sun_1,
                          title: 'App Appearance',
                          subTitle: 'Switch between light and dark mode',
                          trailing: Switch(value: notifier.isDarkMode, onChanged: (value)=>notifier.changeTheme(), activeColor: TColors.primary,),
                        );
                      }
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Location',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}, activeColor: TColors.primary,),
                  ),

                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Custom Notifications',
                    subTitle: 'Receive a notification when items in your wishlist are listed.',
                    trailing: Switch(value: true, onChanged: (value) {}, activeColor: TColors.primary,),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text('Logout')),
                  ),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
