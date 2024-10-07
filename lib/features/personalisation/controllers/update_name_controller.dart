import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/widgets/loaders/loaders.dart';
import 'package:whs_deals_app/data/repositories/user/user_repository.dart';
import 'package:whs_deals_app/features/personalisation/controllers/user_controller.dart';
import 'package:whs_deals_app/utils/constants/image_strings.dart';
import 'package:whs_deals_app/utils/popups/full_screen_loader.dart';
import 'package:whs_deals_app/utils/validators/network_manager.dart';

import '../screens/profile/widgets/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initialiseNames();
    super.onInit();

  }


  Future<void> initialiseNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
        TImages.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim(),};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your Name has been updated.',
      );

      // Move to the previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Stop Loading and show error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
          message: 'Failed to update name. Please try again later.',
      );
    }
  }
}