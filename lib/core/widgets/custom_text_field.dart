import 'package:ev_charging/constants.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.label, this.preIcon, this.suffIcon});
  final String? hintText;
  final String? label;
  final Icon? preIcon;
  final Icon? suffIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        prefixIcon: preIcon,
        prefixIconColor: kSecondaryColor,
        suffix: suffIcon,
        suffixIconColor: kSecondaryColor,
        hintText: hintText,
        label: Text('$label'),
        labelStyle: const TextStyle(color: kSecondaryColor),
        hoverColor: kSecondaryColor,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: kSecondaryColor,
            )),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color: kSecondaryColor,
            )),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
