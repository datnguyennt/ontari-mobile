import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/widget/base_widget.dart';
import 'package:ontari_mobile/modules/auth/bloc/login_bloc/login_bloc.dart';

@RoutePage()
class LoginScreen extends BaseView<LoginBloc> {
  const LoginScreen({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login screen'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (text) {
              // final bloc = BlocProvider.of<LoginBloc>(context);
              // bloc.add(LoginUsernameChanged(text));
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Username',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (text) {
              // final bloc = BlocProvider.of<LoginBloc>(context);
              // bloc.add(LoginPasswordChanged(text));
            },
            obscureText: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  LoginBloc createBloc() {
    return LoginBloc();
  }
}
