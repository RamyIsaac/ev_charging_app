import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/Designer (1).jpeg'),
          radius: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Name of user',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
            child: Text('+2012000009', style: TextStyle(color: Colors.grey))),
        const SizedBox(
          height: 20,
        ),
        ProfileItem(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kEditProfileView);
          },
          icon: Icons.person,
          title: 'Edit Profile',
          sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.electric_bolt_outlined,
          title: 'My bookings',
          sufIcon: Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.language_outlined,
          title: 'language',
          sufIcon: Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.fact_check_outlined,
          title: 'Terms & Conditions',
          sufIcon: Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.question_mark_sharp,
          title: 'FAQs',
          sufIcon: Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.privacy_tip_outlined,
          title: 'privacy policy',
          sufIcon: Icon(Icons.arrow_forward_ios_outlined),
        ),
        ProfileItem(
          onTap: () {},
          icon: Icons.logout,
          title: 'logout',
        ),
      ],
    );
  }
}
