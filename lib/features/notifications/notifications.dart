import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/appbar/appbar.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';
import 'package:whs_deals_app/common/widgets/texts/section_heading.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../utils/helpers/helper_functions.dart';
import '../personalisation/screens/profile/widgets/profile.dart';
import 'otherusertile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
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
                      "Messages",
                      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semi Bold
                        color: TColors.white,
                        fontSize: 22,
                      ),
                    ),
                    //actions: [
                      //IconButton(
                        //onPressed: () {},
                        //icon: const Icon(Icons.settings, color: TColors.white),
                      //),
                    //],
                  ),
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(title: "Recent Chats", showActionButton: false),
                  ///SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            OtherUserProfileTile(
              title: 'Jared Bramwell',
              subtitle: 'Is this still available?',
              onPressed: () {},
            ),
            Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5,),
            OtherUserProfileTile(
              title: 'Cole Bramwell',
              subtitle: 'Is this still available?',
              onPressed: () {},
            ),
            Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5,),
            OtherUserProfileTile(
              title: 'Fred Bramwell',
              subtitle: 'Is this still available?',
              onPressed: () {},
            ),
            Divider(color: dark ? TColors.darkGrey : TColors.grey, thickness: 0.5,),

          ],
        ),
      ),
    );
  }
}
