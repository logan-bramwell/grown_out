import 'package:get/get.dart';
import 'package:whs_deals_app/routes/routes.dart';


import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/password_configuration/forgot_password.dart';
import '../features/authentication/screens/signup/widgets/signup.dart';
import '../features/authentication/screens/signup/widgets/verify_email.dart';
import '../features/personalisation/screens/address/addresses.dart';
import '../features/personalisation/screens/profile/widgets/profile.dart';
import '../features/personalisation/screens/settings/settings.dart';
import '../features/shop/models/product_model.dart';
import '../features/shop/screens/home/home.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => HomeScreen(product: ProductModel.empty())),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
