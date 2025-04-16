import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/core/widgets/custom_text_form_field.dart';
import 'package:ev_charging/core/widgets/password_field.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:ev_charging/features/auth/presentation/views/sign_up_view.dart';
import 'package:ev_charging/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String email, name, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 33,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  label: Text('name'),
                  hintText: 'Name',
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  label: Text('email'),
                  hintText: 'email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              PasswordTextField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TermsAndConditions(
                onChange: (value) {
                  isTermsAccepted = value;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted == true) {
                        context
                            .read<SignUpCubit>()
                            .createUserWithEmailAndPassword(
                                email: email, password: password, name: name);
                      } else {
                        showSnackBar(
                            context, ' please accept terms and conditions');
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                  text: 'create account'),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 16,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
