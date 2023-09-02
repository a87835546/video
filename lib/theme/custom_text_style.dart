import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeGray500 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter;
  static get bodyLargeInterGray500 => theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.gray500,
      );
  static get bodyLargeInterPrimary => theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeOnErrorContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get bodyLargePrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: getFontSize(
          13,
        ),
      );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumGray400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
      );
  static get bodyMediumGray400_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray400,
      );
  static get bodyMediumGray500 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );
  static get bodyMediumGray60001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodyMediumGray60001_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodyMediumGray70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray70001,
      );
  static get bodyMediumLightblueA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightBlueA700,
      );
  static get bodyMediumLightblueA70001 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightBlueA70001,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumOnPrimaryContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPlusJakartaSans =>
      theme.textTheme.bodyMedium!.plusJakartaSans;
  static get bodyMediumPlusJakartaSansOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPlusJakartaSansOnPrimaryContainer_1 =>
      theme.textTheme.bodyMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyMediumPrimary_1 => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: getFontSize(
          12,
        ),
      );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallPrimary12 => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: getFontSize(
          12,
        ),
      );
  // Headline text style
  static get headlineSmallLightblueA70001 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.lightBlueA70001,
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleLargeBlack900_1 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallGray600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLightblueA70001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA70001,
      );
  static get titleSmallLightblueA70001Medium =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA70001,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLightblueA70001_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightBlueA70001,
      );
  static get titleSmallPlusJakartaSansGray600 =>
      theme.textTheme.titleSmall!.plusJakartaSans.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get zenKakuGothicNew {
    return copyWith(
      fontFamily: 'Zen Kaku Gothic New',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }
}
