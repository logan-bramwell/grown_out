import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whs_deals_app/common/styles/spacing_styles.dart';
import 'package:whs_deals_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:whs_deals_app/features/authentication/screens/login/widgets/login_header.dart';

import '../../../../common/widgets.login_signup/form_divider.dart';
import '../../../../common/widgets.login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  ///logo, title and subtitle
                  const TLoginHeader(),

                  //form
                  const TLoginForm(),

                  //divider
                  TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //footer
                  const TSocialButtons(),

                ],
              ),
            )));
  }
}





