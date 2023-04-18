import 'package:flutter/material.dart';
import 'package:ontari_mobile/app/util/theme/theme.export.dart';

class ContinueSocialAccountWidget extends StatelessWidget {
  const ContinueSocialAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.kSpacing24.h,
      ),
      child: Text(
        LocaleKeys.text_continue_social_account.tr,
        style: AppStyles.bodyTextMedium(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kGrey,
        ),
      ),
    );
  }
}
