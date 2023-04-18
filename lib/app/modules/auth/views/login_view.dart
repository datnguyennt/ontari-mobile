import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/constants/app_assets.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/login.controller.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';
import 'package:ontari_mobile/app/util/theme/app_color.dart';
import 'package:ontari_mobile/app/util/theme/app_size.dart';
import 'package:ontari_mobile/app/util/theme/app_text_style.dart';
import 'package:ontari_mobile/app/widgets/footer.widget.dart';
import 'package:ontari_mobile/app/widgets/header.widget.dart';
import 'package:ontari_mobile/app/widgets/rounded_button.widget.dart';
import 'package:ontari_mobile/app/widgets/text_continue_social.widget.dart';
import 'package:ontari_mobile/app/widgets/text_field.widget.dart';
import 'package:ontari_mobile/generated/locales.g.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(),
            _buildBody(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  FooterWidget _buildFooter() {
    return FooterWidget(
      firstString: LocaleKeys.sign_in_body_don_have_account.tr,
      lastString: LocaleKeys.sign_in_body_create_here.tr,
      onTap: () {
        Get.toNamed(Routes.SIGN_UP);
      },
    );
  }

  HeaderWidget _buildHeader() {
    return HeaderWidget(
      title: LocaleKeys.sign_in_header_title.tr,
      description: LocaleKeys.sign_in_header_description.tr,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.kHorizonSpace.w,
        vertical: AppSize.kSpacing32.h,
      ),
      child: Column(
        children: [
          _buildLoginForm(),
          _buildForgotPassword(context),
          _buildButtonSignIn(context),
          const ContinueSocialAccountWidget(),
          _buildSocialButtons(context),
        ],
      ),
    );
  }

  Column _buildSocialButtons(BuildContext context) {
    return Column(
      children: [
        _buildSocialButton(
          context,
          buttonText: LocaleKeys.button_sign_in_google,
          iconPath: AppAssets.icGoogle,
          onTap: () {},
        ),
        SizedBox(
          height: AppSize.kSpacing16.h,
        ),
        _buildSocialButton(
          context,
          buttonText: LocaleKeys.button_sign_in_facebook,
          iconPath: AppAssets.icFacebook,
          onTap: () async {},
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

  RoundedButton _buildButtonSignIn(BuildContext context) {
    return RoundedButton(
      onPressed: () {},
      buttonColor:
          Get.isDarkMode ? AppColors.kPrimaryDark : AppColors.kSecondaryLight,
      child: Text(
        LocaleKeys.button_sign_in.tr,
        style: AppStyles.bodyTextMedium(context).copyWith(
          color: AppColors.kWhite,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: AppSize.kSpacing12.h,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.kRadius10.r,
            ),
          ),
          // padding: EdgeInsets.zero,
          onPressed: () {},
          child: Text(
            LocaleKeys.text_forgot_password.tr,
            style: AppStyles.bodyTextMedium(context).copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              // height: 19.12 / 14,
              // fontStyle: FontStyle.normal,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
        ),
      ),
    );
  }

  Column _buildLoginForm() {
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
          height: AppSize.kRadius16.h,
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
}
