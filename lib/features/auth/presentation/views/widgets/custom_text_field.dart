import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.preicon,
    this.suffIcon,
    required this.label,
    required this.hint,
    this.onChanged,
    this.obsecureText = false,
  });
  final Function(String)? onChanged;
  final String label;
  final String hint;
  final Icon? preicon;
  final IconButton? suffIcon;
  final bool obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Required Field';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIconColor: kSecondaryColor,
        label: Text(
          label,
        ),
        hintText: hint,
        suffixIcon: suffIcon,
        prefixIcon: preicon,
        hintStyle: const TextStyle(color: kSecondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: kSecondaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: kSecondaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: kSecondaryColor),
        ),
      ),
    );
  }
}
