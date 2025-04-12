import 'package:ev_charging/core/utils/api_keys.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const ChargeGo());
}

class ChargeGo extends StatelessWidget {
  const ChargeGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//paymentIntentObject create payment intent (amount , currency)
//initPaymentSheet (paymentIntentClientSecret)
//presentPaymentSheet
