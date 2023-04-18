import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/app/constants/countries.dart';
import 'package:ontari_mobile/app/modules/auth/views/otp.view.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';
import 'package:ontari_mobile/app/util/theme/theme.export.dart';
import 'package:ontari_mobile/app/widgets/footer.widget.dart';
import 'package:ontari_mobile/app/widgets/header.widget.dart';
import 'package:ontari_mobile/app/widgets/rounded_button.widget.dart';
import 'package:ontari_mobile/app/widgets/text_continue_social.widget.dart';
import 'package:ontari_mobile/app/widgets/text_field.widget.dart';

import '../controllers/sign_up.controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(context),
            _buildBody(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  FooterWidget _buildFooter() {
    return FooterWidget(
      firstString: LocaleKeys.sign_up_body_already_have_account.tr,
      lastString: LocaleKeys.sign_up_body_sign_in.tr,
      onTap: () {
        Get.toNamed(Routes.LOGIN);
      },
    );
  }

  HeaderWidget _buildHeader(BuildContext context) {
    return HeaderWidget(
      title: LocaleKeys.sign_up_header_title.tr,
      description: LocaleKeys.sign_up_header_description.tr,
      height: 170,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.kHorizonSpace.w,
        vertical: AppSize.kSpacing24.h,
      ),
      child: Column(
        children: [
          _buildSignUpForm(context),
          _buildCheckPolicy(context),
          _buildButtonSignUp(context),
          const ContinueSocialAccountWidget(),
          _buildSocialButtons(context),
        ],
      ),
    );
  }

  RoundedButton _buildButtonSignUp(BuildContext context) {
    return RoundedButton(
      onPressed: () {
        controller.createUserByEmail();
        // Get.to(
        //   () => OTPInputView(
        //     phoneNumber: controller.fullPhoneNumber,
        //     onVerify: () {},
        //   ),
        // );
      },
      margin: EdgeInsets.only(top: AppSize.kSpacing8.h),
      buttonColor:
          Get.isDarkMode ? AppColors.kPrimaryDark : AppColors.kSecondaryLight,
      child: Text(
        LocaleKeys.button_sign_up.tr,
        style: AppStyles.bodyTextMedium(context).copyWith(
          color: AppColors.kWhite,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Row _buildSocialButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSocialButton(
            context,
            buttonText: LocaleKeys.text_google,
            iconPath: AppAssets.icGoogle,
            onTap: () {},
          ),
        ),
        SizedBox(
          width: AppSize.kSpacing24.w,
        ),
        Expanded(
          child: _buildSocialButton(
            context,
            buttonText: LocaleKeys.text_facebook,
            iconPath: AppAssets.icFacebook,
            onTap: () {},
          ),
        ),
      ],
    );
  }

  RoundedButton _buildSocialButton(
    BuildContext context, {
    required String buttonText,
    required String iconPath,
    required VoidCallback onTap,
  }) {
    return RoundedButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.kRadius12.r,
        ),
        side: const BorderSide(
          color: AppColors.kBorderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 16.w,
            width: 16.w,
          ),
          SizedBox(width: AppSize.kSpacing16.w),
          Text(
            buttonText.tr,
            style: AppStyles.bodyTextMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              height: 19.2 / 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckPolicy(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.kSpacing20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => GestureDetector(
              onTap: () {
                controller.updateChecked();
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppSize.kSpacing8.h,
                  right: AppSize.kSpacing8.h,
                ),
                child: Icon(
                  controller.checked
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_outlined,
                  size: 25.w,
                  color: controller.checked
                      ? AppColors.kGreen
                      : AppColors.kGrey600,
                ),
              ),
            ),
          ),
          Flexible(
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.updateChecked();
                      },
                    text: LocaleKeys.text_policy_description.tr,
                    style: AppStyles.bodyTextMedium(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      height: 18 / 12,
                      color: AppColors.kGrey,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // onTap();
                      },
                    text: LocaleKeys.text_policy_term_and_condition.tr,
                    style: AppStyles.bodyTextMedium(context).copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      height: 18 / 12,
                      color: AppColors.kPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildSignUpForm(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          label: LocaleKeys.text_email.tr,
          prefixIcon: AppAssets.icEmail,
          hintText: LocaleKeys.text_enter_email.tr,
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: AppSize.kSpacing16.h,
        ),
        Obx(
          () => TextFieldWidget(
            label: LocaleKeys.text_phone_number.tr,
            prefixIcon: controller.selectedCountry.flag,
            hintText: "${controller.selectedCountry.phoneCode} 000 000 000",
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            onTapPrefixIcon: () {
              _showBottomCountryCode(context);
            },
          ),
        ),
        SizedBox(
          height: AppSize.kSpacing16.h,
        ),
        Obx(
          () => TextFieldWidget(
            label: LocaleKeys.text_password.tr,
            prefixIcon: AppAssets.icPassword,
            hintText: LocaleKeys.text_enter_password.tr,
            controller: controller.passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.showPassword ? false : true,
            suffixIcon: controller.showPassword
                ? AppAssets.icEyeOpen
                : AppAssets.icEyeClosed,
            onTapSuffixIcon: controller.onChangeVisiblePassword,
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showBottomCountryCode(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.kRadius16),
          topRight: Radius.circular(AppSize.kRadius16),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.kHorizonSpace.w,
            vertical: AppSize.kSpacing12.h,
          ),
          child: SizedBox(
              height: Get.height / 2,
              child: Column(
                children: [
                  Text(
                    "Select country",
                    style: AppStyles.headline4(context),
                  ),
                  SizedBox(
                    height: AppSize.kSpacing20.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      commonCountry.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          bottom: AppSize.kSpacing12.h,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.setSelectedCountry(commonCountry[index]);
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                commonCountry[index].flag,
                              ),
                              SizedBox(
                                width: AppSize.kSpacing12.w,
                              ),
                              Expanded(
                                child: Text(
                                  commonCountry[index].phoneCode,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  commonCountry[index].displayName,
                                  textAlign: TextAlign.left,
                                  style: AppStyles.bodyTextMedium(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
