import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              TAppBar(
                showBackArrow: true,
                title: Text('Your Wishlist'),

              )

            ],
          )


      ),
    );
  }
}