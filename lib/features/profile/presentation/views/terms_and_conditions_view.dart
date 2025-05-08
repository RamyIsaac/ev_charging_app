import 'package:ev_charging/core/functions/build_titles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Welcome to Go Charge!'),
            buildSectionContent(
                'By using Go Charge, you confirm that you are at least 18 years old or have the legal capacity to enter into a binding agreement. You also agree to comply with all applicable laws and regulations in Egypt.'),
            buildSectionTitle('1. Acceptance of Terms'),
            buildSectionContent(
                'By using Go Charge, you confirm that you are at least 18 years old or have the legal capacity to enter into a binding agreement. You also agree to comply with all applicable laws and regulations in Egypt.'),
            buildSectionTitle('2. Account Registration'),
            buildSectionContent(
                'To access certain features of Go Charge, you may be required to create an account. You agree to provide accurate, current, and complete information during registration. You are responsible for maintaining the security of your account credentials and must notify us immediately of any unauthorized use of your account.'),
            buildSectionTitle('3. Service Description'),
            buildSectionContent(
                'Go Charge provides a platform to locate, reserve, and pay for EV charging stations across Egypt. The application does not own or operate the charging stations but acts as an intermediary between users and charging station providers.'),
            buildSectionTitle('4. User Responsibilities'),
            buildSectionContent(
                'You agree to use Go Charge only for lawful purposes. You must not misuse or damage any charging station or related equipment. You are responsible for paying all fees associated with your use of the charging services and must comply with all instructions provided by the application and charging station operators.'),
            buildSectionTitle('5. Fees and Payments'),
            buildSectionContent(
                'All fees for using the charging services will be displayed within Go Charge. Payment is processed through secure third-party payment gateways. You are responsible for any taxes or additional charges that may apply.'),
            buildSectionTitle('6. Cancellation and Refunds'),
            buildSectionContent(
                'Reservations for charging stations may be canceled subject to the cancellation policy displayed in Go Charge. Refunds, if applicable, will be processed in accordance with the application’s refund policy.'),
            buildSectionTitle('7. Privacy Policy'),
            buildSectionContent(
                'Your use of Go Charge is subject to our Privacy Policy, which outlines how we collect, use, and protect your personal information. By using the application, you consent to the practices described in the Privacy Policy.'),
            buildSectionTitle('8. Limitation of Liability'),
            buildSectionContent(
                'Go Charge is not responsible for any damages, losses, or injuries arising from your use of the application or charging stations. We do not guarantee the availability, functionality, or safety of any charging station.'),
            buildSectionTitle('9. Intellectual Property'),
            buildSectionContent(
                'All content, logos, and software within Go Charge are the property of Go Charge or its licensors. You may not reproduce, distribute, or modify any part of the application without prior written consent.'),
            buildSectionTitle('10. Termination'),
            buildSectionContent(
                'We reserve the right to suspend or terminate your access to Go Charge at any time, without notice, for any reason, including but not limited to a violation of these Terms and Conditions.'),
            buildSectionTitle('11. Governing Law'),
            buildSectionContent(
                'These Terms and Conditions are governed by the laws of the Arab Republic of Egypt. Any disputes arising from your use of the application shall be resolved in the courts of Egypt.'),
            buildSectionTitle('12. Changes to Terms and Conditions'),
            buildSectionContent(
                'We reserve the right to update or modify these Terms and Conditions at any time. Your continued use of Go Charge after any changes constitutes your acceptance of the revised terms.'),
            buildSectionTitle('13. Contact Us'),
            buildSectionContent(
                'If you have any questions or concerns about these Terms and Conditions, please contact us at:\n\nEmail: ramyeshak191@gmail.com\nAddress: Cairo, Egypt'),
          ],
        ),
      ),
    );
  }
}
