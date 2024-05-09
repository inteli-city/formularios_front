import 'package:flutter/material.dart';
import 'package:formularios_front/app/shared/themes/app_colors.dart';
import 'package:formularios_front/app/shared/themes/app_dimensions.dart';
import 'package:formularios_front/app/shared/themes/app_text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    splashColor: Colors.transparent,
    shadowColor: AppColors.primaryBlue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    dividerColor: AppColors.primaryBlue,
    dividerTheme: DividerThemeData(
      color: AppColors.primaryBlue,
      thickness: AppDimensions.borderMedium,
      indent: 5,
      endIndent: 5,
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      elevation: MaterialStatePropertyAll(5),
      padding: MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: AppDimensions.paddingMedium,
          horizontal: AppDimensions.paddingMedium * 2,
        ),
      ),
    )),
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryBlue;
        }
        return Colors.grey;
      }),
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radiusLarge,
          ),
        ),
        alignment: AlignmentDirectional.center,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.display,
      headlineLarge: AppTextStyles.headline,
      titleMedium: AppTextStyles.titleMedium,
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,
    ),
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 4,
      shadowColor: AppColors.primaryBlue,
      surfaceTintColor: AppColors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.display,
      contentPadding: const EdgeInsets.only(
        left: AppDimensions.paddingMedium,
        right: AppDimensions.paddingMedium,
        top: AppDimensions.paddingExtraLarge * 2,
      ),
      alignLabelWithHint: true,
      floatingLabelStyle: AppTextStyles.display,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.radiusLarge,
        ),
        borderSide: BorderSide(
          color: AppColors.primaryBlue,
          width: AppDimensions.borderMedium,
        ),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryBlue,
      size: AppDimensions.iconLarge,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconColor: MaterialStateProperty.all(
          AppColors.primaryBlue,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryBlue,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.white,
      surfaceTintColor: AppColors.white,
    ),
    colorScheme: ColorScheme(
      background: AppColors.white,
      onBackground: AppColors.white,
      brightness: Brightness.light,
      primary: AppColors.primaryBlue,
      onPrimary: AppColors.primaryBlue,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      error: AppColors.red,
      shadow: AppColors.primaryBlue,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.white,
    ),
  );

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
