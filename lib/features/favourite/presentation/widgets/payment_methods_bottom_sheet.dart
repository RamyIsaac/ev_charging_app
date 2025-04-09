import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'choose Payment Method',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 18,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Continue',
            textColor: Colors.white,
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMakePaymentView);
            },
          ),
        ],
      ),
    );
  }
}
