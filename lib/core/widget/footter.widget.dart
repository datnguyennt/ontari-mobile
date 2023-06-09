import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';

class FooterWidget extends StatelessWidget {
  final String firstString;
  final String lastString;
  final VoidCallback onTap;
  const FooterWidget({
    super.key,
    required this.firstString,
    required this.lastString,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _buildFooter(context);
  }

  Widget _buildFooter(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.kRadius10.h),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: firstString,
                style: AppStyles.bodyTextMedium(context).copyWith(
                  fontWeight: FontWeight.w200,
                  fontSize: 14.sp,
                  height: 19.2 / 14,
                ),
              ),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    onTap();
                  },
                text: lastString,
                style: AppStyles.bodyTextMedium(context).copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  height: 19.2 / 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
