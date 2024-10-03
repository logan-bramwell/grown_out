import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:whs_deals_app/common/widgets/loaders/loaders.dart';
import 'package:whs_deals_app/features/personalisation/controllers/user_controller.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/validators/network_manager.dart';
import '../screens/profile/widgets/profile.dart';

class SelectSchoolController extends GetxController {
  static SelectSchoolController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = Get.find<UserRepository>();
  final GlobalKey<FormState> selectSchoolFormKey = GlobalKey<FormState>();

  RxString selectedSchool = ''.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    initialiseSelectedSchool();
  }

  Future<void> initialiseSelectedSchool() async {
    selectedSchool.value = userController.user.value.selectedSchool;
    box.write('selectedSchool', selectedSchool.value);
  }

  Future<void> selectSchool() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'We are updating your selected school...',
        TImages.docerAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      if (!selectSchoolFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> school = {
        'SelectedSchool': selectedSchool.value.trim(),
      };

      await userRepository.updateSingleField(school);

      userController.user.update((user) {
        user?.selectedSchool = selectedSchool.value.trim();
      });
      box.write('selectedSchool', selectedSchool.value.trim());

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your selected school has been updated.',
      );

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: 'An error occurred while updating your selected school. Please try again.',
      );
    }
  }

  void setSelectedSchool(String school) {
    selectedSchool.value = school;
    box.write('selectedSchool', school);
  }
}