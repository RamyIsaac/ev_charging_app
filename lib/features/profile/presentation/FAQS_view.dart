import 'package:ev_charging/core/utils/functions/build_faq_item.dart';
import 'package:flutter/material.dart';

class FAQsView extends StatelessWidget {
  const FAQsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildFAQItem(
              context,
              'What is Charge Go?',
              'Charge Go is an EV charging application that allows users to find, reserve, and pay for charging stations across Egypt.',
            ),
            buildFAQItem(
              context,
              'How do I find a charging station?',
              'You can search for nearby charging stations using the app’s map feature or search bar.',
            ),
            buildFAQItem(
              context,
              'How do I pay for charging?',
              'Payments can be made directly through the app using various payment methods, including credit cards and mobile wallets.',
            ),
            buildFAQItem(
              context,
              'Is there a refund policy?',
              'Refund policies depend on the station provider. Please check the provider’s terms before initiating a charging session.',
            ),
            buildFAQItem(
              context,
              'What if I face an issue with a charging station?',
              'If you encounter any problems, you can report the issue through the app or contact customer support.',
            ),
          ],
        ),
      ),
    );
  }
}
