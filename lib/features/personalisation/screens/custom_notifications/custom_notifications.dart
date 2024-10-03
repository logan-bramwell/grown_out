import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('WishList'),
      ),
      body: const Center(
          child: Text("This page will allow users to input the item(s) they want using a drop down menu, then based on the item it will show more categories like size (shirts have a size, ties dont.")
      ),
    );
  }
}
