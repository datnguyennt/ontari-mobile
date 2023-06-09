import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/theme/theme.export.dart';
import '../../../core/routes/router.dart';
import '../../../core/widget/footter.widget.dart';
import '../../../core/widget/header.widget.dart';
import '../../../core/widget/rounded_button.widget.dart';
import '../../../core/widget/text_field.widget.dart';
import '../../../di/di.dart';
import '../../../generated/assets.gen.dart';
import '../../../generated/locale_keys.g.dart';
import '../../core/blocs/app_bloc/app_bloc.dart';
import '../bloc/login_bloc/login_bloc.dart';
import '../widgets/continue_soicial_account.widget.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  LoginView({super.key});
  final AppBloc themeBloc = getIt<AppBloc>();
  final LoginBloc loginBloc = getIt<LoginBloc>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeader(context),
              _buildBody(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildFooter(context),
      ),
    );
  }

  FooterWidget _buildFooter(BuildContext context) {
    return FooterWidget(
      firstString: LocaleKeys.sign_in_body_don_have_account.tr(),
      lastString: LocaleKeys.sign_in_body_create_here.tr(),
      onTap: () {
        context.router.pushNamed(Routes.register);
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
          buttonText: LocaleKeys.button_sign_in_phone,
          iconPath: Assets.icons.icPhone.path,
          onTap: () {
            context.router.push(LogInPhoneNumberRoute(loginBloc: loginBloc));
          },
        ),
        SizedBox(
          height: AppSize.kSpacing16.h,
        ),
        _buildSocialButton(
          context,
          buttonText: LocaleKeys.button_sign_in_google,
          iconPath: Assets.icons.icGoogle.path,
          onTap: () {},
        ),
        SizedBox(
          height: AppSize.kSpacing16.h,
        ),
        _buildSocialButton(
          context,
          buttonText: LocaleKeys.button_sign_in_facebook,
          iconPath: Assets.icons.icGoogle.path,
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

  Widget _buildButtonSignIn(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (context, state) {
        return state.loginStatus == LoginStatus.failure;
      },
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty &&
            state.loginStatus == LoginStatus.failure) {
          debugPrint(state.errorMessage);
        }
      },
      builder: (context, state) {
        return RoundedButton(
          height: 52.h,
          onPressed: () async {
            loginBloc.add(
              LoginCreadentialSubmitted(
                email: emailController.text,
                password: passwordController.text,
              ),
            );
          },
          disableBackgroundColor: AppColors.kGreyscale,
          backgroundColor: themeBloc.isDarkMode
              ? AppColors.kPrimaryDark
              : AppColors.kSecondaryLight,
          isLoading: state.loginStatus == LoginStatus.inProgress,
          child: Text(
            LocaleKeys.button_sign_in.tr(),
            style: AppStyles.bodyTextMedium(context).copyWith(
              color: AppColors.kWhite,
              fontSize: 14.sp,
              height: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
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
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) => previous.email != current.email,
          builder: (context, state) {
            return TextFieldWidget(
              label: LocaleKeys.text_email.tr(),
              prefixIcon: Assets.icons.icEmail.svg(),
              hintText: LocaleKeys.text_enter_email.tr(),
              controller: emailController,
              errorText: state.email.displayError,
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) => loginBloc.add(LoginEmailChanged(email)),
            );
          },
        ),
        SizedBox(
          height: AppSize.kRadius16.h,
        ),
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (previous, current) =>
              previous.password != current.password ||
              previous.showPassword != current.showPassword,
          builder: (context, state) {
            return TextFieldWidget(
              label: LocaleKeys.text_password.tr(),
              prefixIcon: Assets.icons.icPassword.svg(),
              hintText: LocaleKeys.text_enter_password.tr(),
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              errorText: state.password.displayError,
              onChanged: (password) =>
                  loginBloc.add(LoginPasswordChanged(password)),
              obscureText: state.showPassword ? false : true,
              suffixIcon: state.showPassword
                  ? Assets.icons.icEyeOpen.svg()
                  : Assets.icons.icEyeClosed.svg(),
              onTapSuffixIcon: () => loginBloc.add(const TonglePasswordEvent()),
            );
          },
        ),
      ],
    );
  }
}
