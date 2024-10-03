import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/data/repositories/authentication/authentication_repository.dart';
import 'package:whs_deals_app/data/repositories/user/user_repository.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/validators/network_manager.dart';
import '../../../personalisation/models/user_model.dart';
import '../../screens/signup/widgets/verify_email.dart'; // Ensure the path to UserModel is correct

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  //final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      // Show loading dialog
      TFullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        TImages.docerAnimation,
      );

      // Check network connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: "No Connection",
          message: "Please check your internet connection and try again.",
        );
        return;
      }

      // Form Validation Check
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Check Privacy Policy
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: "Accept Privacy Policy",
          message: "In order to create an account, you must read and accept the Privacy Policy & Terms of Use.",
        );
        return;
      }

      // Register with email and password
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim(),);

      // Save authenticated user data in Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),
        //phoneNumber: phoneNumber.text.trim(),
        profilePicture: "", selectedSchool: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify your email to continue.',
      );

      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Signup Failed',
        message: e.toString(),
      );
    }
  }
}