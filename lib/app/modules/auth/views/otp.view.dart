import 'package:flutter/material.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/sign_up.controller.dart';
import 'package:ontari_mobile/app/modules/auth/widgets/otp_input.widget.dart';
import 'package:ontari_mobile/app/util/theme/theme.export.dart';
import 'package:ontari_mobile/app/widgets/rounded_button.widget.dart';

class OTPInputView extends StatelessWidget {
  OTPInputView({super.key, required this.onVerify, required this.phoneNumber});
  final String phoneNumber;
  final Function onVerify;
  final controller = SignUpController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomNavigationBar: _buildButtonVerifyOTP(context),
    );
  }

  Widget _buildButtonVerifyOTP(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom > 0
              ? 0
              : AppSize.kSpacing10.h,
        ),
        child: RoundedButton(
          onPressed: () {
            debugPrint(controller.otp);
          },
          margin: EdgeInsets.symmetric(
            horizontal: AppSize.kHorizonSpace.w,
            vertical: AppSize.kRadius10,
          ),
          buttonColor: Get.isDarkMode
              ? AppColors.kPrimaryDark
              : AppColors.kSecondaryLight,
          child: Text(
            LocaleKeys.button_sign_in.tr,
            style: AppStyles.bodyTextMedium(context).copyWith(
              color: AppColors.kWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.kHorizonSpace.w,
        vertical: AppSize.kSpacing48.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButtonBack(),
          Padding(
            padding: EdgeInsets.only(
              top: AppSize.kSpacing40.h,
              bottom: AppSize.kSpacing6.h,
            ),
            child: Text(
              LocaleKeys.text_phone_verification.tr,
              style: AppStyles.headline2(context),
            ),
          ),
          Text(
            LocaleKeys.text_we_have_sent_code.trParams(
              {
                'phone_number': phoneNumber,
              },
            ),
            style: AppStyles.bodyTextMedium(context)
                .copyWith(color: AppColors.kGrey),
          ),
          OTPInputWidget(
            textControllers: controller.ditgitControllers,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonBack() {
    return Container(
      width: 40.w,
      height: 40.w,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        right: AppSize.kHorizonSpace.w,
      ),
      child: RoundedButton(
        onPressed: () {
          Get.back();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.kRadius10.r,
          ),
        ),
        buttonColor: AppColors.kWhite,
        child: SvgPicture.asset(
          AppAssets.icBack,
          color: AppColors.kPrimaryLight,
          height: 15.w,
          width: 15.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
