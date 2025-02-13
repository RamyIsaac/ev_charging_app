import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      )),
    );
  }
}
