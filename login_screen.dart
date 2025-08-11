import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_event.dart';
import 'package:flutter_bloc_app/bloc/auth/auth_state.dart';
import 'package:flutter_bloc_app/utils/constants.dart';
import 'package:flutter_bloc_app/utils/validators.dart';
import 'package:flutter_bloc_app/widgets/custom_button.dart';
import 'package:flutter_bloc_app/widgets/custom_textfield.dart';
import 'package:formz/formz.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstants.loginTitle)),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hintText: AppConstants.emailHint,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  errorText: _emailController.text.isEmpty
                      ? null
                      : Email.dirty(_emailController.text).error ==
                              EmailValidationError.invalid
                          ? AppConstants.invalidEmailError
                          : null,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: AppConstants.passwordHint,
                  obscureText: true,
                  controller: _passwordController,
                  errorText: _passwordController.text.isEmpty
                      ? null
                      : Password.dirty(_passwordController.text).error ==
                              PasswordValidationError.invalid
                          ? AppConstants.invalidPasswordError
                          : null,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 24),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: AppConstants.loginButtonText,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(LoginEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ));
                        }
                      },
                      isLoading: state.status == AuthStatus.loading,
                    );
                  },
                ),
                if (context.select((AuthBloc bloc) => bloc.state.errorMessage !=
                    null) ...[
                  const SizedBox(height: 16),
                  Text(
                    context.read<AuthBloc>().state.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}