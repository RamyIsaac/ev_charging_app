import 'package:ev_charging/core/utils/api_keys.dart';
import 'package:ev_charging/core/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paymob/flutter_paymob.dart';

abstract class PaymobService {
  static Future<bool> initPaymob() async {
    try {
      return await FlutterPaymob.instance.initialize(
        apiKey: ApiKeys.paymobKey,
        integrationID: 5074069,
        walletIntegrationId: 5074093,
        iFrameID: 917497,
      );
    } on Exception catch (e) {
      print("Error from Paymob => : $e");
      return false;
    }
  }

  static Future<void> payWithCard(BuildContext context) async {
    var outerResponse = await FlutterPaymob.instance.payWithCard(
      context: context,
      currency: "EGP",
      amount: 100,
      onPayment: (response) {
        //the successful payment is reversed ... if not true mean success otherwise failed
        if (!response.success == true) {
          showSnackBar(context, response.message ?? "payment success");
        } else {
          showSnackBar(context, response.message ?? "payment failed");
        }
      },
    );
    print("response from Paymob => ${outerResponse.message}");
    print("response from Paymob => ${outerResponse.success}");
  }
}
