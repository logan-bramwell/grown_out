import 'package:flutter/material.dart';
import 'package:whs_deals_app/common/widgets/custom%20shapes/containers/primary_header_container.dart';

import '../../../utils/constants/sizes.dart';
import 'community_appbar.dart';


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
                    CommunityAppBar(),



                    const Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: Column(
                        children: [

                          ///SizedBox(height: TSizes.spaceBtwSections),
                        ],
                      ),
                    ),




                  ],

                )
            )
          ],
        ),
      ),

    );
  }
}
