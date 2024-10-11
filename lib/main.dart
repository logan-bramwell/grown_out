import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'features/personalisation/controllers/select_school_controller.dart';
import 'features/personalisation/controllers/user_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // Ensure widget binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Preserve the native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

  // Initialize Firebase
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    Get.put(AuthenticationRepository());
  } catch (e) {
    // Handle initialization error
    print("Error initializing Firebase: $e");
    return; // Exit if Firebase fails to initialize
  }

  // Initialize controllers
  Get.put(SelectSchoolController());
  Get.put(UserController());

  // Run the app
  runApp(const App());
}

