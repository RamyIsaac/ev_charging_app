import 'dart:io';

import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/core/widgets/custom_text_form_field.dart';
import 'package:ev_charging/core/widgets/password_field.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

late String email, password;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _SignInViewBodyState extends State<SignInViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  label: const Text('email'),
                  hintText: 'email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forget Password ?',
                    style: TextStyle(
                      color: kSecondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignInCubit>().signInWithEmailAndPassword(
                          email: email, password: password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Sign In '),
              const SizedBox(height: 16),
              const DontHaveAccount(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 33),
              SocialLoginButton(
                  onPressed: () {
                    context.read<SignInCubit>().signInWithGoogle();
                  },
                  label: 'Sign in with Google',
                  image: 'assets/Icons/google_icon.svg'),
              const SizedBox(height: 16),
              Platform.isIOS
                  ? SocialLoginButton(
                      onPressed: () {},
                      label: 'Sign in with Apple',
                      image: 'assets/Icons/apple_icon.svg')
                  : Container(),
              const SizedBox(height: 16),
              SocialLoginButton(
                  onPressed: () {
                    context.read<SignInCubit>().signInWithFacebook();
                  },
                  label: 'Sign in with Facebook',
                  image: 'assets/Icons/facebook_icon.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account? '),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignUpView);
          },
          child: Text(
            'Create Account',
            style: TextStyle(
                fontSize: 16,
                color: kSecondaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
