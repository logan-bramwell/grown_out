import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whs_deals_app/bindings/general_bindings.dart';
import 'package:whs_deals_app/routes/app_routes.dart';
import 'package:whs_deals_app/utils/constants/colors.dart';
import 'package:whs_deals_app/utils/theme/theme.dart';
import 'package:whs_deals_app/utils/theme/theme_provider.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (BuildContext context) => ThemeNotifier()..init(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: notifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            initialBinding: GeneralBindings(),
            getPages: AppRoutes.pages,
            home: Scaffold(
              backgroundColor: notifier.isDarkMode ? TColors.darkGrey : TColors.white,
              body: Center(
                child: CircularProgressIndicator(
                  color: notifier.isDarkMode ? TColors.white : TColors.darkGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
