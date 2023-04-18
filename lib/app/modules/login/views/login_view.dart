import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ontari_mobile/app/modules/login/controllers/login_controller.dart';
import 'package:ontari_mobile/app/util/theme/app_size.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.kHorizontalSpace.w,
              ),
              child: _buildForm(),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildForm() {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocalKey.login_welcome_back.tr(),
            style: AppStyles.body2,
          ),
          const SizedBox(height: 40),
          BlocBuilder<LoginBloc, LoginState>(
            // buildWhen: (previous, current) => previous.email != current.email,
            builder: (context, state) {
              return TextFieldWidget(
                label: LocaleKeys.texts_email_address.tr(),
                keyboardType: TextInputType.emailAddress,
                hintText: 'name@email.com',
                onChange: (username) => context
                    .read<LoginBloc>()
                    .add(LoginEmailChanged(username)),
                controller: _emailController,
                // validator: (_) => _state.email.displayError?.getTextValidate,
                textInputAction: TextInputAction.next,
                errorText: state.email.displayError?.getTextValidate,
              );
            },
          ),
          const SizedBox(height: 15),
          BlocBuilder<LoginBloc, LoginState>(
            // buildWhen: (previous, current) =>
            //     previous.password != current.password,
            builder: (context, state) {
              return TextFieldWidget(
                label: LocaleKeys.texts_password.tr(),
                keyboardType: TextInputType.text,
                obscureText: true,
                hintText: 'Nhập vào mật khẩu',
                controller: _passwordController,
                errorText: state.password.displayError?.getTextValidate,
                onChange: (password) => context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password)),
              );
            },
          ),
          const SizedBox(height: 15),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.status.isInProgress
                  ? const CircularProgressIndicator()
                  : AppRoundedButton(
                onPressed: () {
                  if (state.status.isSuccess) {
                    context
                        .read<LoginBloc>()
                        .add(const LoginSubmitted());
                  }
                },
                content: LocaleKeys.login_sign_in.tr(),
                width: double.infinity,
              );
            },
          ),
        ],
      ),
    ),
  }
}