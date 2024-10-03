import 'package:flutter/material.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('My Listings'),
      ),
      body: const Center(
          child: Text("This page will simply show all the users current listings in a row, and allow them to add a new listing from here, delete a listing, edit a listing etc. ")
      ),
    );
  }
}