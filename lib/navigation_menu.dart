import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:whs_deals_app/features/community/screens/community.dart';
import 'package:whs_deals_app/features/notifications/notifications.dart';
import 'package:whs_deals_app/features/personalisation/screens/settings/settings.dart';
import 'package:whs_deals_app/features/shop/screens/home/home.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/helpers/helper_functions.dart';

import 'features/shop/models/product_model.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          
          destinations: const[
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.people), label: 'Community'),
            NavigationDestination(icon: Icon(Iconsax.notification), label: 'Notifications'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(product: ProductModel.empty()), const CommunityPage(), const NotificationsScreen(), const SettingsScreen()];
}