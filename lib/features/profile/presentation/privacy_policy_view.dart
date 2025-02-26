import 'package:ev_charging/core/utils/functions/build_titles.dart';
import 'package:flutter/material.dart';

const Color kSecondaryColor = Color(0xff219998);

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSectionTitle('Privacy Policy'),
              buildSectionContent(
                  'Charge Go is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and protect your personal information.'),
              buildSectionTitle('1. Information We Collect'),
              buildSectionContent(
                  'We collect personal details such as name, email, and location to enhance your experience with Charge Go.'),
              buildSectionTitle('2. How We Use Your Information'),
              buildSectionContent(
                  'Your information is used for account management, payment processing, and improving our services.'),
              buildSectionTitle('3. Data Security'),
              buildSectionContent(
                  'We implement security measures to protect your personal data from unauthorized access.'),
              buildSectionTitle('4. Contact Us'),
              buildSectionContent(
                  'If you have any questions about this Privacy Policy, please contact us at ramyeshak191@gmail.com .'),
            ],
          ),
        ),
      ),
    );
  }
}
