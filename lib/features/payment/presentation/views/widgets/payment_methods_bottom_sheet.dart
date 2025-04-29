import 'dart:developer';

import 'package:ev_charging/core/services/paymob_service.dart';
import 'package:ev_charging/core/utils/api_keys.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/utils/styles.dart';
import 'package:ev_charging/core/widgets/custom_button.dart';
import 'package:ev_charging/features/payment/data/models/amount_paypal_model/amount_paypal_model.dart';
import 'package:ev_charging/features/payment/data/models/amount_paypal_model/details.dart';
import 'package:ev_charging/features/payment/data/models/items_paypal_model/item.dart';
import 'package:ev_charging/features/payment/data/models/items_paypal_model/items_paypal_model.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ev_charging/features/payment/data/repos/payment_repo_impl.dart';
import 'package:ev_charging/features/payment/presentation/manager/cubit/stripe_payment_cubit.dart';
import 'package:ev_charging/features/payment/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
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
                onTap: () async {
                  if (PaymentMethodsListView.activeIndex == 0) {
                    PaymentIntentInputModel paymentIntentInputModel =
                        PaymentIntentInputModel(
                      customerId: 'cus_S6L7yZeYsGAI9m',
                      amount: 100,
                      currency: 'usd',
                    );
                    BlocProvider.of<StripePaymentCubit>(context)
                        .makePayment(paymentIntentInputModel);
                  } else if (PaymentMethodsListView.activeIndex == 1) {
                    //paypal payment
                    var transactionsData = getTransactions();
                    executePaypalPayment(context, transactionsData);
                  } else {
                    await PaymobService.payWithCard(context);
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void executePaypalPayment(
      BuildContext context,
      ({
        AmountPaypalModel amount,
        ItemsPaypalModel itemsPaypalModel
      }) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecret,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemsPaypalModel.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountPaypalModel amount, ItemsPaypalModel itemsPaypalModel})
      getTransactions() {
    var amount = AmountPaypalModel(
        currency: "USD",
        details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
        total: "100");

    List<Item> items = [
      Item(name: "Apple", quantity: 10, price: "4", currency: "USD"),
      Item(name: "Apple", quantity: 12, price: "5", currency: "USD"),
    ];
    var itemsPaypalModel = ItemsPaypalModel(items: items);

    return (amount: amount, itemsPaypalModel: itemsPaypalModel);
  }
}
