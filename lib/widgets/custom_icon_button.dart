import 'package:flutter/material.dart';
import 'package:video/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.margin,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  }) : super(
          key: key,
        );

  final Alignment? alignment;

  final EdgeInsetsGeometry? margin;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: SizedBox(
          height: height ?? 0,
          width: width ?? 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Container(
              padding: padding ?? EdgeInsets.zero,
              decoration: decoration ??
                  BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.2),
                    borderRadius:
                        BorderRadius.circular(getHorizontalSize(16.00)),
                  ),
              child: child,
            ),
            onPressed: onTap,
          ),
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(getHorizontalSize(4.00)),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(getHorizontalSize(24.00)),
      );
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.06),
        borderRadius: BorderRadius.circular(getHorizontalSize(4.00)),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        borderRadius: BorderRadius.circular(getHorizontalSize(4.00)),
        border: Border.all(
          color: appTheme.black900.withOpacity(0.12),
          width: getHorizontalSize(1.00),
        ),
      );
  static BoxDecoration get gradientGreenAToOnSecondaryContainer =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(getHorizontalSize(12.00)),
        gradient: LinearGradient(
          begin: Alignment(0.5, 0),
          end: Alignment(0.5, 1),
          colors: [
            appTheme.greenA200,
            theme.colorScheme.onSecondaryContainer,
          ],
        ),
      );
}
