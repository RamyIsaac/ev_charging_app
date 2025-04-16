import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key, required this.label, this.onPressed, required this.image});
  final String label;
  final String image;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                width: 1,
                color: Colors.grey.shade400,
              )),
        ),
        child: ListTile(
            visualDensity:
                const VisualDensity(vertical: VisualDensity.minimumDensity),
            leading: SvgPicture.asset(image),
            title: Text(
              textAlign: TextAlign.center,
              label,
              style: Styles.textStyle18.copyWith(color: kSecondaryColor),
            )),
      ),
    );
  }
}
