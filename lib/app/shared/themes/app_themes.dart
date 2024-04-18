import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';

class AppThemes {
  static final lightTheme = ThemeData(
      iconTheme: IconThemeData(color: AppColors.white),
      scaffoldBackgroundColor: AppColors.white,
      cardTheme: CardTheme(
        color: AppColors.primaryBlue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.cornerLarge),
            side: BorderSide(
                color: AppColors.primaryBlue,
                width: AppDimensions.thin,
                style: BorderStyle.solid)),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(AppColors.white))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBlue,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryBlue),
      colorScheme: ColorScheme(
        background: AppColors.white,
        onBackground: AppColors.white,
        brightness: Brightness.light,
        primary: AppColors.primaryBlue,
        onPrimary: AppColors.primaryBlue,
        secondary: AppColors.primaryBlue,
        onSecondary: AppColors.primaryBlue,
        error: AppColors.red,
        shadow: AppColors.primaryBlue,
        onError: AppColors.red,
        surface: AppColors.white,
        onSurface: AppColors.white,
      ));

  static final darkTheme = ThemeData(
    primaryColor: AppColors.black,
    brightness: Brightness.dark,
  );
}
