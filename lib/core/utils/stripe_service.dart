import 'package:dio/dio.dart';
import 'package:ev_charging/core/utils/api_keys.dart';
import 'package:ev_charging/core/utils/api_service.dart';
import 'package:ev_charging/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:ev_charging/features/payment/data/models/init_payment_sheet_input_model.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKeys.secretKey,
      contentType: Headers.formUrlEncodedContentType,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
      customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKeySecret,
      customerId: initPaymentSheetInputModel.customerId,
      merchantDisplayName: 'Ramy Isaac',
    ));
  }

  Future presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
      customerId: paymentIntentInputModel.customerId,
    );
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);

    await presentPaymentSheet();
  }

  //  Future<PaymentIntentModel> createCustomer(
  //     PaymentIntentInputModel paymentIntentInputModel) async {
  //   var response = await apiService.post(
  //     url: 'https://api.stripe.com/v1/payment_intents',
  //     body: paymentIntentInputModel.toJson(),
  //     token: ApiKeys.secretKey,
  //     contentType: Headers.formUrlEncodedContentType,
  //   );

  //   var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

  //   return paymentIntentModel;
  // }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        body: {'customer': customerId},
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2025-03-31.basil'
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}
