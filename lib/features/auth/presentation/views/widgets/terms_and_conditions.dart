import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({
    super.key,
    required this.onChange,
  });
  final ValueChanged<bool> onChange;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: CustomCheckBox(
            onChange: (value) {
              isTermsAccepted = value;
              widget.onChange(value);
              setState(() {});
            },
            isCkecked: isTermsAccepted,
          ),
        ),
        const Expanded(
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'by creating a new account you agree to the ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Terms and Conditions',
                  style: TextStyle(
                    color: kSecondaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isCkecked,
    required this.onChange,
  });

  final bool isCkecked;
  final ValueChanged<bool> onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Checkbox(
          fillColor: isCkecked
              ? const WidgetStatePropertyAll(kSecondaryColor)
              : const WidgetStatePropertyAll(Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isCkecked,
          onChanged: (value) {
            onChange(value ?? false);
          }),
    );
  }
}
