import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whs_deals_app/common/widgets/loaders/loaders.dart';
import 'package:whs_deals_app/data/repositories/user/user_repository.dart';
import 'package:whs_deals_app/features/personalisation/models/user_model.dart';
import 'package:whs_deals_app/utils/constants/sizes.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/validators/network_manager.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/widgets/re_authenticate_user_login_form.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());


  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Connection',
          message: 'Please check your internet connection.',
        );
        return;
      }

      profileLoading.value = true;
      final fetchedUser = await userRepository.fetchUserDetails();
      user.value = fetchedUser;  // Update with fetched data
    } catch (e) {
      user.value = UserModel.empty();  // Handle errors
    } finally {
      profileLoading.value = false;
    }
  }


  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty && userCredentials != null) {
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');

        final newUser = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          email: userCredentials.user!.email ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
          selectedSchool: '',
        );

        await userRepository.saveUserRecord(newUser);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving your information.',
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible.',
      confirm: ElevatedButton(
        onPressed: () async => await deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
        onPressed: () => Get.back(),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
        verifyEmail.text.trim(),
        verifyPassword.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage(
            'Users/Images/Profile/', image);

        // Update the user's profile picture URL
        await userRepository.updateSingleField({'profilePicture': imageUrl});

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(
          title: 'Success',
          message: 'Your profile picture has been updated!',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  Future<void> updateUserName(String firstName, String lastName) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.docerAnimation);

      // Manually create an updated user object
      final updatedUser = UserModel(
        id: user.value.id,
        firstName: firstName,
        lastName: lastName,
        email: user.value.email,
        profilePicture: user.value.profilePicture,
        selectedSchool: user.value.selectedSchool,
      );

      // Update the user details in the repository
      await userRepository.updateSingleField({
        'firstName': updatedUser.firstName,
        'lastName': updatedUser.lastName,
      });

      // Update the local user model
      user.value = updatedUser;

      TLoaders.successSnackBar(
        title: 'Success',
        message: 'Your name has been updated!',
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
