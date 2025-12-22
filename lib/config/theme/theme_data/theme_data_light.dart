import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_text_styles.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.surfacePageLight,
    primaryColorLight: AppColors.primary600,
    primaryColorDark: AppColors.primary400,
    focusColor: AppColors.focusColorLight,
    hoverColor: AppColors.hoverColorLight,
    disabledColor: AppColors.disableColorLight,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primaryDefault,
      primary: AppColors.primaryDefault,
      onPrimary: AppColors.textOnActionLight,
      error: AppColors.errorDefault,
      onError: AppColors.textOnActionLight,
      errorContainer: AppColors.surfaceErrorLight,
      onErrorContainer: AppColors.textActionLight,
      surface: AppColors.surfaceDefaultLight,
      onSurface: AppColors.textHeadingsLight,
      onSurfaceVariant: AppColors.textBodyLight,
      surfaceContainer: AppColors.surfaceContainerLight,
      onSecondaryContainer: AppColors.textOnActionLight,
      outline: AppColors.borderDefaultLight,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.surfaceDefaultLight),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(),
      headlineMedium: AppTextStyles.headlineMedium(),
      headlineSmall: AppTextStyles.headlineSmall(),
      titleLarge: AppTextStyles.titleLarge(),
      titleMedium: AppTextStyles.titleMedium(),
      titleSmall: AppTextStyles.titleSmall(),
      bodyLarge: AppTextStyles.bodyLarge(),
      bodyMedium: AppTextStyles.bodyMedium(),
      bodySmall: AppTextStyles.bodySmall(),
      labelLarge: AppTextStyles.labelLarge(),
      labelMedium: AppTextStyles.labelMedium(),
      labelSmall: AppTextStyles.labelSmall(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 60.0),
        foregroundColor: AppColors.textOnActionLight,
        backgroundColor: AppColors.surfaceActionLight,
        disabledBackgroundColor: AppColors.surfaceDisabledLight,
        disabledForegroundColor: AppColors.textDisabledLight,
        iconColor: AppColors.iconsOnActionLight,
        disabledIconColor: AppColors.iconsDisabledLight,
        side: BorderSide(color: AppColors.borderActionLight),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.0),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 60.0),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textActionLight,
        disabledBackgroundColor: AppColors.surfaceDisabledLight,
        disabledForegroundColor: AppColors.textDisabledLight,
        iconColor: AppColors.iconsOnActionLight,
        disabledIconColor: AppColors.iconsDisabledLight,
        side: BorderSide(color: AppColors.borderActionLight),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.0),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textActionLight,
        textStyle: AppTextStyles.buttonSecondary(),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textBodyLight,
        iconSize: 16.0,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.surfaceDefaultLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8.0),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.borderDefaultLight,
      thickness: 0.7,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDefaultLight,
      hoverColor: AppColors.surfacePageLight,
      labelStyle: AppTextStyles.bodyMedium(),
      hintStyle: AppTextStyles.bodySmall(),
      helperStyle: AppTextStyles.bodySmall(color: AppColors.textInfoLight),
      errorStyle: AppTextStyles.bodySmall(color: AppColors.textErrorLight),
      prefixIconColor: AppColors.iconsDefaultLight,
      suffixIconColor: AppColors.iconsActionLight,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDefaultLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDefaultLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderFocusLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderErrorLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDisabledLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
