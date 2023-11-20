import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumPrimaryContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get bodySmallErrorContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get bodySmallInterBlack900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 10.fSize,
      );
  static get bodySmallPoppinsOnPrimaryContainer =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 11.fSize,
      );
  static get bodySmallPoppinsWhiteA700 =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: appTheme.whiteA700,
        fontSize: 11.fSize,
      );
  // D text style
  static get dMSansBluegray100 => TextStyle(
        color: appTheme.blueGray100,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w700,
      ).dMSans;
  // Headline text style
  static get headlineLargeLightgreenA200 =>
      theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.lightGreenA200,
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeOnPrimaryContainer =>
      theme.textTheme.headlineLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get headlineLargeTeal900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.teal900,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelMediumErrorContainer => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get labelSmallDMSans => theme.textTheme.labelSmall!.dMSans.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelSmallDMSansOnPrimaryContainer =>
      theme.textTheme.labelSmall!.dMSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w500,
      );
  // Poppins text style
  static get poppinsOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).poppins;
  static get poppinsWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w400,
      ).poppins;
  // Title text style
  static get titleLarge21 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 21.fSize,
      );
  static get titleLargeLightgreenA200 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.lightGreenA200,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w400,
      );
  static get titleLargePrimaryContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get titleLargeTeal900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.teal900,
        fontWeight: FontWeight.w400,
      );
  static get titleSmallErrorContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );
  static get titleSmallOnPrimaryContainer_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleSmallPoppinsOnPrimaryContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
