import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          Text(
            'Name',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            label: 'Name',
            hintText: 'ex: Ramy',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Email',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            label: 'Email',
            hintText: 'ex: Ramy9090@example.com',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Mobile number',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            label: 'Phone',
            hintText: '+2012000009',
          ),
          SizedBox(
            height: 80,
          ),
          CustomButton(text: 'Update'),
        ],
      ),
    );
  }
}
