import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/community/community_post.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../personalisation/screens/address/single_address.dart';
import '../../shop/screens/widgets/home_appbar.dart';



class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(text: TTexts.communityAppbarTitle),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],

                )
            ),
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [

                  CommunityPost()

                  ///SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
