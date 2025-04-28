import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ClipRRect(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile_image.png'),
        radius: 70,
      ),
    );
  }
}
