import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/charging_cars.webp',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height * 0.39,
      width: double.infinity,
    );
  }
}
