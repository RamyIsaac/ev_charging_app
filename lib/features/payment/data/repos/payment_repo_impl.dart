import 'package:dartz/dartz.dart';
import 'package:ev_charging/core/errors/failures.dart';
import 'package:ev_charging/core/services/stripe_service.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ev_charging/features/payment/data/repos/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayent(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
