import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/auth/presentation/widgets/custom_button.dart';
import 'package:ev_charging/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  String? email, password;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: 400,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/Designer (1).jpeg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  ' Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    color: kSecondaryColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    email = data;
                  },
                  label: 'Email',
                  hint: 'Ex: namexxxxxx@gmail.com',
                  preicon: const Icon(Icons.email_sharp),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  suffIcon: IconButton(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off,
                        color: kSecondaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  ),
                  obsecureText: isObscure,
                  label: 'Password',
                  hint: 'make strong password',
                  preicon: const Icon(Icons.password),
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userSignIn();
                        showSnackBar(context, 'Signed In Successfully');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(
                              context, 'No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,
                              'Wrong password provided for that user.');
                        }
                      } catch (e) {
                        showSnackBar(context,
                            'there was an error, please try again later.');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kSignupView);
                      },
                      child: const Text(
                        ' Sign Up',
                        style: TextStyle(
                          color: kSecondaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userSignIn() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    GoRouter.of(context).push(AppRouter.kHomeView);
  }
}
