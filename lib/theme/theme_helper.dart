import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.lightGreenA200,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray200,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 16.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 13.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 8.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 32.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 10.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: colorScheme.onPrimaryContainer.withOpacity(1),
          fontSize: 9.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 21.fSize,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 16.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          color: colorScheme.onSecondaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF5BA82C),
    primaryContainer: Color(0XFFC10E19),
    secondaryContainer: Color(0XFFABABAB),

    // Error colors
    errorContainer: Color(0XFF555555),
    onErrorContainer: Color(0XFF0600B3),

    // On colors(text colors)
    onPrimary: Color(0XFF0D1A0B),
    onPrimaryContainer: Color(0XACFFFFFF),
    onSecondaryContainer: Color(0XFF181D27),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black900 => Color(0XFF000000);

  // Blue
  Color get blue400 => Color(0XFF499FEF);

  // BlueGray
  Color get blueGray100 => Color(0XFFD7D7D7);
  Color get blueGray100A0 => Color(0XA0D9D9D9);
  Color get blueGray50 => Color(0XFFEBF7F7);

  // DeepPurple
  Color get deepPurple900 => Color(0XFF0601B4);

  // Gray
  Color get gray200 => Color(0XFFE8E8E8);
  Color get gray500 => Color(0XFFABABAB);

  // Green
  Color get green200 => Color(0XFFAFD6A1);

  // LightGreen
  Color get lightGreen800 => Color(0XFF559D2A);
  Color get lightGreenA200 => Color(0XFFC1FF72);

  // Red
  Color get red400 => Color(0XFFEC5865);

  // Teal
  Color get teal900 => Color(0XFF006837);

  // White
  Color get whiteA700 => Color(0XFFFDFDFD);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
