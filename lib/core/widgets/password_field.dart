import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        obscureText: obscureText,
        onSaved: (value) {},
        label: const Text('Password'),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: obscureText
              ? const Icon(
                  Icons.visibility_off,
                  color: kSecondaryColor,
                )
              : const Icon(
                  Icons.visibility,
                  color: kSecondaryColor,
                ),
        ),
        hintText: 'Password',
        textInputType: TextInputType.visiblePassword);
  }
}
