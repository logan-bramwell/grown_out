import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/appbar_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/chip_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:whs_deals_app/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}

class AppTheme {
  static final TextStyle lightText = GoogleFonts.poppins(
    color: AppColors.blackTextColor,
  );

  static TextStyle blackTextStyle = GoogleFonts.poppins(
    color: AppColors.blackTextColor,
  );
  static TextStyle whiteTextStyle = GoogleFonts.poppins(
    color: AppColors.whiteColor,
  );
  static TextStyle greyTextStyle = GoogleFonts.poppins(
    color: AppColors.greyTextColor,
  );

  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;

  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor, // Keep this as it is
    colorScheme: const ColorScheme.light().copyWith(
      surface: AppColors.whiteColor, // This replaces backgroundColor
      primary: AppColors.primaryColor,
    ),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: AppColors.whiteColor,
    ),
  );
}
