import 'package:ev_charging/features/profile/presentation/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: const EditProfileViewBody(),
    );
  }
}
