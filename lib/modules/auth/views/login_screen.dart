import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/core/widget/base_widget.dart';
import 'package:ontari_mobile/core/widget/footter.widget.dart';
import 'package:ontari_mobile/core/widget/header.widget.dart';
import 'package:ontari_mobile/core/widget/rounded_button.widget.dart';
import 'package:ontari_mobile/core/widget/text_field.widget.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';
import 'package:ontari_mobile/modules/auth/bloc/login_bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends BaseView<LoginBloc> {
  const LoginScreen({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
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
      firstString: LocaleKeys.sign_in_body_don_have_account.tr(),
      lastString: LocaleKeys.sign_in_body_create_here.tr(),
      onTap: () {
        // Get.toNamed(Routes.SIGN_UP);
      },
    );
  }

  HeaderWidget _buildHeader(BuildContext context) {
    return HeaderWidget(
      title: LocaleKeys.sign_in_header_title.tr(),
      description: LocaleKeys.sign_in_header_description.tr(),
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
          // const ContinueSocialAccountWidget(),
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
            buttonText.tr(),
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
      onPressed: () {
        // controller.signInCredential();
      },
      // buttonColor:
      //     Get.isDarkMode ? AppColors.kPrimaryDark : AppColors.kSecondaryLight,
      child: Text(
        LocaleKeys.button_sign_in.tr(),
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
            LocaleKeys.text_forgot_password.tr(),
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
          label: LocaleKeys.text_email.tr(),
          prefixIcon: AppAssets.icEmail,
          hintText: LocaleKeys.text_enter_email.tr(),
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: AppSize.kRadius16.h,
        ),
TextFieldWidget(
            label: LocaleKeys.text_password.tr(),
            prefixIcon: AppAssets.icPassword,
            hintText: LocaleKeys.text_enter_password.tr(),
            controller: TextEditingController(),
            keyboardType: TextInputType.visiblePassword,
            // obscureText: controller.showPassword ? false : true,
            // suffixIcon: controller.showPassword
            //     ? AppAssets.icEyeOpen
            //     : AppAssets.icEyeClosed,
            // onTapSuffixIcon: controller.onChangeVisiblePassword,
          ),
      ],
    );
  }

  @override
  LoginBloc createBloc() {
    return LoginBloc();
  }
}
