import 'package:flutter/material.dart';
import '../common/theme/theme.export.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const ElevatedContainer({
    required this.child,
    Key? key,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          boxShadow: [
            // BoxShadow(
            //   color: AppColors.elevatedContainerColorOpacity,
            //   spreadRadius: 3,
            //   blurRadius: 8,
            //   offset: const Offset(0, 3), // changes position of shadow
            // ),
          ],
          color: AppColors.pageBackground),
      child: child,
    );
  }
}
