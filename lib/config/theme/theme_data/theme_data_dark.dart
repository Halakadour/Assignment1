import 'package:flutter/material.dart';

import '../../scales/sizes_config.dart';
import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_text_styles.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.surfacePageDark,
    primaryColor: AppColors.primaryDefault,
    primaryColorLight: AppColors.primary600,
    primaryColorDark: AppColors.primary400,
    focusColor: AppColors.focusColorDark,
    hoverColor: AppColors.hoverColorDark,
    disabledColor: AppColors.disableColorDark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primaryDefault,
      primary: AppColors.primaryDefault,
      onPrimary: AppColors.textOnActionDark,
      error: AppColors.errorDefault,
      onError: AppColors.textOnActionDark,
      errorContainer: AppColors.surfaceErrorDark,
      onErrorContainer: AppColors.textActionDark,
      surface: AppColors.surfaceDefaultDark,
      onSurface: AppColors.textHeadingsDark,
      onSurfaceVariant: AppColors.textBodyDark,
      surfaceContainer: AppColors.surfaceContainerDark,
      onSecondaryContainer: AppColors.textOnActionDark,
      outline: AppColors.borderDefaultDark,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.surfaceDefaultDark),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(
        color: AppColors.textHeadingsDark,
      ),
      headlineMedium: AppTextStyles.headlineMedium(
        color: AppColors.textHeadingsDark,
      ),
      headlineSmall: AppTextStyles.headlineSmall(
        color: AppColors.textHeadingsDark,
      ),
      titleLarge: AppTextStyles.titleLarge(color: AppColors.textBodyDark),
      titleMedium: AppTextStyles.titleMedium(color: AppColors.textBodyDark),
      titleSmall: AppTextStyles.titleSmall(color: AppColors.textBodyDark),
      bodyLarge: AppTextStyles.bodyLarge(color: AppColors.textBodyDark),
      bodyMedium: AppTextStyles.bodyMedium(color: AppColors.textBodyDark),
      bodySmall: AppTextStyles.bodySmall(color: AppColors.textBodyDark),
      labelLarge: AppTextStyles.labelLarge(color: AppColors.textLabelDark),
      labelMedium: AppTextStyles.labelMedium(color: AppColors.textLabelDark),
      labelSmall: AppTextStyles.labelSmall(color: AppColors.textLabelDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 50.0),
        foregroundColor: AppColors.textOnActionDark,
        backgroundColor: AppColors.surfaceActionDark,
        disabledBackgroundColor: AppColors.surfaceDisabledDark,
        disabledForegroundColor: AppColors.textDisabledDark,
        iconColor: AppColors.iconsOnActionDark,
        disabledIconColor: AppColors.iconsDisabledDark,
        side: BorderSide(color: AppColors.borderActionDark),
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
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 60.0),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textBodyDark,
        disabledBackgroundColor: AppColors.surfaceDisabledDark,
        disabledForegroundColor: AppColors.textDisabledDark,
        iconColor: AppColors.iconsOnActionDark,
        disabledIconColor: AppColors.iconsDisabledDark,
        side: BorderSide(color: AppColors.borderDefaultDark),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.0),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textActionDark,
        textStyle: AppTextStyles.buttonSecondary(),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textBodyDark,
        iconSize: 16.0,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.surfaceDefaultDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8.0),
      ),
    ),
    iconTheme: IconThemeData(size: SizesConfig.iconsSm),
    dividerTheme: DividerThemeData(
      color: AppColors.borderDefaultDark,
      thickness: 0.7,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceContainerDark,
      hoverColor: AppColors.surfaceContainerDark,
      labelStyle: AppTextStyles.labelSmall(color: AppColors.textBodyDark),
      hintStyle: AppTextStyles.labelSmall(color: AppColors.textBodyDark),
      helperStyle: AppTextStyles.labelSmall(color: AppColors.textInfoDark),
      errorStyle: AppTextStyles.labelSmall(color: AppColors.textErrorDark),
      prefixIconColor: AppColors.iconsDefaultDark,
      suffixIconColor: AppColors.iconsActionDark,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDefaultDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDefaultDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderFocusDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderErrorDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDisabledDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceContainerDark,
      titleTextStyle: AppTextStyles.bodyMedium(
        color: AppColors.textHeadingsDark,
      ),
    ),
  );
}
