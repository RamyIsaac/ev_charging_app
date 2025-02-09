import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    super.key,
    required this.text,
  });
  final String text;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
