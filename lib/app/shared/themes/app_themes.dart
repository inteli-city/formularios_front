import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      shadowColor: AppColors.primaryBlue,
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 4,
        shadowColor: AppColors.primaryBlue,
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStateProperty.all(AppColors.white),
      )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBlue,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.white),
      colorScheme: ColorScheme(
        background: AppColors.white,
        onBackground: AppColors.white,
        brightness: Brightness.light,
        primary: AppColors.white,
        onPrimary: AppColors.white,
        secondary: AppColors.primaryBlue,
        onSecondary: AppColors.primaryBlue,
        error: AppColors.red,
        shadow: AppColors.primaryBlue,
        onError: AppColors.red,
        surface: AppColors.white,
        onSurface: AppColors.white,
      ));

  static final darkTheme = ThemeData(
      iconTheme: IconThemeData(color: AppColors.primaryBlue),
      shadowColor: AppColors.primaryBlue,
      scaffoldBackgroundColor: AppColors.primaryBlue,
      cardTheme: CardTheme(
        color: AppColors.primaryBlue,
        elevation: 4,
        shadowColor: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.white, style: BorderStyle.solid),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStateProperty.all(AppColors.primaryBlue))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.white,
      ),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColors.primaryBlue),
      colorScheme: ColorScheme(
        background: AppColors.primaryBlue,
        onBackground: AppColors.primaryBlue,
        brightness: Brightness.dark,
        primary: AppColors.primaryBlue,
        onPrimary: AppColors.primaryBlue,
        secondary: AppColors.white,
        onSecondary: AppColors.white,
        error: AppColors.red,
        shadow: AppColors.primaryBlue,
        onError: AppColors.red,
        surface: AppColors.white,
        onSurface: AppColors.white,
      ));
}
