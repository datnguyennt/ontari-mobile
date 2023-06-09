import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? buttonColor;
  final double? buttonHeight;
  final Widget child;
  final ShapeBorder? shape;
  const RoundedButton({
    super.key,
    required this.onPressed,
    this.buttonColor,
    this.buttonHeight,
    required this.child,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 52.h,
      width: double.infinity,
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
