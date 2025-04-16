import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:ev_charging/features/profile/presentation/views/widgets/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Profile',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const ProfileImage(),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Ramy Isaac',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          const Center(
            child: Text('+20 1205301271', style: TextStyle(color: Colors.grey)),
          ),
          const SizedBox(height: 20),
          ProfileItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kEditProfileView);
            },
            icon: Icons.person,
            title: 'Edit Profile',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMyBokingsView);
            },
            icon: Icons.electric_bolt_outlined,
            title: 'My bookings',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () {},
            icon: Icons.language_outlined,
            title: 'Language',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kTermsAndConditionsView);
            },
            icon: Icons.fact_check_outlined,
            title: 'Terms & Conditions',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kFAQsView);
            },
            icon: Icons.question_mark_sharp,
            title: 'FAQs',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kPrivacyPolicyView);
            },
            icon: Icons.privacy_tip_outlined,
            title: 'Privacy Policy',
            sufIcon: const Icon(Icons.arrow_forward_ios_outlined),
          ),
          ProfileItem(
            onTap: () async {
              await _logout(context);
            },
            icon: Icons.logout,
            title: 'Logout',
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logout failed. Please try again.')),
      );
    }
  }
}
