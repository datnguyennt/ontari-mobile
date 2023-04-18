import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ontari_mobile/app/util/theme/app_size.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.onPressed,
    this.buttonColor,
    this.buttonHeight,
    required this.child,
    this.shape,
    this.margin = EdgeInsets.zero,
  });
  final VoidCallback onPressed;
  final Color? buttonColor;
  final double? buttonHeight;
  final Widget child;
  final ShapeBorder? shape;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight ?? 52.h,
      width: double.infinity,
      margin: margin,

      // color: buttonColor,
      child: MaterialButton(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppSize.kRadius12.r,
              ),
            ),
        color: buttonColor,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
