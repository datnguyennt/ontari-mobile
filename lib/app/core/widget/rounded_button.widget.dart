import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/theme/app_color.dart';
import '../common/theme/app_size.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final double? borderRadius;
  final double? elevation;

  final Color? backgroundColor;
  final Color? disableBackgroundColor;
  final Color? shadowColor;
  final Color? loadingColor;

  final bool isLoading;
  final bool isDisable;
  final bool isFullSize;

  final Widget? child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final BorderSide? borderSide;
  final ShapeBorder? shape;

  const RoundedButton({
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.elevation,
    this.backgroundColor,
    this.disableBackgroundColor,
    this.shadowColor,
    this.loadingColor,
    this.isDisable = false,
    this.isLoading = false,
    this.isFullSize = true,
    this.child,
    this.borderSide,
    this.margin = EdgeInsets.zero,
    this.shape,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: isFullSize
          ? null
          : BoxConstraints(
              maxWidth: width ?? double.infinity,
              maxHeight: height ?? AppSize.kSpacing50,
            ),
      height: isFullSize ? (height ?? AppSize.kSpacing50) : null,
      width: isFullSize ? (width ?? double.infinity) : null,
      margin: margin,
      child: MaterialButton(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? AppSize.kRadius12,
              ),
            ),
        elevation: elevation,
        padding: padding,
        color: backgroundColor,
        onPressed: (isDisable || isLoading) ? null : onPressed,
        disabledColor:
            disableBackgroundColor ?? AppColors.kPrimaryDark.withOpacity(0.5),
        child: _buildChild(),
      ),
    );
  }

  Widget? _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: loadingColor ?? AppColors.kWhite,
              )
            : CircularProgressIndicator(
                strokeWidth: 1.8,
                valueColor: AlwaysStoppedAnimation<Color>(
                  loadingColor ?? AppColors.kWhite,
                ),
              ),
      );
    }
    return child;
  }
}
