import 'package:ev_charging/core/functions/upload_station_to_firebase.dart';
import 'package:ev_charging/core/services/firestore_service.dart';
import 'package:ev_charging/core/services/paymob_service.dart';
import 'package:ev_charging/core/services/shared_preferences_singleton.dart';
import 'package:ev_charging/core/utils/api_keys.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/utils/custom_bloc_observer.dart';
import 'package:ev_charging/core/services/get_it_service.dart';

import 'package:ev_charging/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

//bool _dataSeeded = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  Stripe.publishableKey = ApiKeys.publishableKey;
  //await SupabaseService.initSupabase();
  await PaymobService.initPaymob();
  setupGetIt();
  await SharedPreferencesSingleton.init();
  // final databaseService = FirestoreService();
  // if (!_dataSeeded) {
  //   await uploadStationsToFirestore(databaseService);
  //   _dataSeeded = true;
  // }
  runApp(const ChargeGo());
}

class ChargeGo extends StatelessWidget {
  const ChargeGo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData(
      //   primaryColor: kSecondaryColor,
      // ),
      // color: kSecondaryColor,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//paymentIntentObject create payment intent (amount , currency)
//initPaymentSheet (paymentIntentClientSecret)
//presentPaymentSheet
