import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/images/profile_image.png',
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ramy Isaac',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontWeight: FontWeight.bold),
            ),
            Text(
              'find your nearest charging point ',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: kSecondaryColor,
            size: 24,
          ),
        ),
      ],
    );
  }
}
