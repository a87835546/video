import 'package:flutter/material.dart';
import 'package:video/theme/theme_helper.dart';

import '../core/utils/size_utils.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.5),
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.12),
      );
  static BoxDecoration get fillBlack9001 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.06),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray10001,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );

  // Gradient decorations
  static BoxDecoration get gradientGrayToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.gray100,
            appTheme.gray100,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryContainerToSecondaryContainer =>
      BoxDecoration(
        border: Border.all(
          color: appTheme.black900,
          width: getHorizontalSize(1),
        ),
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToOnPrimaryContainer =>
      BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onPrimary,
            appTheme.black900.withOpacity(0),
            theme.colorScheme.onPrimaryContainer,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToGray => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            appTheme.gray100,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToGray10002 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary,
            appTheme.gray10002,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            theme.colorScheme.primary.withOpacity(0.2),
            theme.colorScheme.primary.withOpacity(0),
            theme.colorScheme.primary,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToPrimary1 => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.2, 0),
          end: Alignment(0.2, 0.5),
          colors: [
            theme.colorScheme.primary.withOpacity(0),
            theme.colorScheme.primary,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        border: Border.all(
          color: appTheme.black900.withOpacity(0.12),
          width: getHorizontalSize(1),
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder12 => BorderRadius.circular(
        getHorizontalSize(12),
      );
  static BorderRadius get circleBorder24 => BorderRadius.circular(
        getHorizontalSize(24),
      );
  static BorderRadius get circleBorder40 => BorderRadius.circular(
        getHorizontalSize(40),
      );

  // Custom borders
  static BorderRadius get customBorderTL24 => BorderRadius.vertical(
        top: Radius.circular(getHorizontalSize(24)),
      );

  // Rounded borders
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        getHorizontalSize(20),
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        getHorizontalSize(4),
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
