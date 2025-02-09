import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:ev_charging/features/auth/presentation/widgets/custom_button.dart';
import 'package:ev_charging/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String? email;

  String? password;

  bool isLoading = false;
  bool isObsecure = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
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
                  ' Sign Up',
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
                        isObsecure ? Icons.visibility : Icons.visibility_off,
                        color: kSecondaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                  ),
                  obsecureText: isObsecure,
                  label: 'Password',
                  hint: 'make strong password',
                  preicon: const Icon(Icons.password),
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  text: 'Sign Up',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await userSignUp();
                        showSnackBar(context, 'Registered Successfully');
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, 'Password is too weak. ');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already in use. ');
                        }
                      } catch (e) {
                        showSnackBar(context,
                            'there was an error, please try again later.');
                      }
                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        ' Sign In',
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

  Future<void> userSignUp() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
