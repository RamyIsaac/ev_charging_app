import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ev_charging/features/payment/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:ev_charging/features/payment/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          BlocConsumer<StripePaymentCubit, StripePaymentState>(
            listener: (context, state) {
              if (state is StripePaymentSuccess) {
                GoRouter.of(context).push(AppRouter.kMakePaymentView);
              }
              if (state is StripePaymentFailure) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is StripePaymentLoading ? true : false,
                text: 'Continue',
                textColor: Colors.white,
                onTap: () {
                  PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                    amount: 100,
                    currency: 'usd',
                  );
                  BlocProvider.of<StripePaymentCubit>(context)
                      .makePayment(paymentIntentInputModel);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
