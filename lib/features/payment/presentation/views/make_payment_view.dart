import 'package:ev_charging/features/payment/presentation/views/widgets/make_payment_view_body.dart';
import 'package:flutter/material.dart';

class MakePaymentView extends StatelessWidget {
  const MakePaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Payment'),
      ),
      body: const MakePaymentViewBody(),
    );
  }
}
