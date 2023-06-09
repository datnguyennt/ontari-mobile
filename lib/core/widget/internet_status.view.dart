import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/size_config.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/generated/assets.gen.dart';

class InternetStatusView extends StatelessWidget {
  const InternetStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: Assets.images.noInternet.image(
              width: SizeConfig.screenWidth * 0.7,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.kSpacing20),
            child: _buildMessage(context),
          )
        ],
      ),
    );
  }

  RichText _buildMessage(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'No internet connection. ',
        style: AppStyles.bodyTextMedium(context)
            .copyWith(color: AppColors.kPrimaryDark),
        children: <TextSpan>[
          TextSpan(
            text: 'Please check your',
            style: AppStyles.bodyTextMedium(context),
          ),
          TextSpan(
            text: ' network settings ',
            style: AppStyles.bodyTextMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryLight,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: AppStyles.bodyTextMedium(context),
          ),
          TextSpan(
            text: 'try again.',
            style: AppStyles.bodyTextMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.kPrimaryLight,
            ),
          )
        ],
      ),
    );
  }
}
