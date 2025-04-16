import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider()),
        SizedBox(width: 12),
        Text('OR',
            style: TextStyle(
              fontSize: 16,
            )),
        SizedBox(width: 12),
        Expanded(child: Divider()),
      ],
    );
  }
}
