import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/core/widgets/custom_text_form_field.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
                label: Text('email'),
                hintText: 'email',
                textInputType: TextInputType.emailAddress),
            SizedBox(height: 16),
            CustomTextFormField(
                label: Text('Password'),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kSecondaryColor,
                ),
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword),
            SizedBox(height: 16),
            Row(
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
            SizedBox(height: 33),
            CustomButton(text: 'Sign In '),
            SizedBox(height: 16),
            DontHaveAccount(),
            SizedBox(height: 33),
            OrDivider(),
            SizedBox(height: 33),
            SocialLoginButton(
                label: 'Sign in with Google',
                image: 'assets/Icons/google_icon.svg'),
            SizedBox(height: 16),
            SocialLoginButton(
                label: 'Sign in with Apple',
                image: 'assets/Icons/apple_icon.svg'),
            SizedBox(height: 16),
            SocialLoginButton(
                label: 'Sign in with Facebook',
                image: 'assets/Icons/facebook_icon.svg'),
          ],
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
