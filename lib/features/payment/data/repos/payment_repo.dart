import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';

abstract class PaymentRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
