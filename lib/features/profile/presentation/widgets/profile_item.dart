import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    Icon? sufIcon,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;
  final Icon? sufIcon = const Icon(
    Icons.arrow_forward_ios,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(title),
          trailing: sufIcon,
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 60,
        ),
      ],
    );
  }
}
