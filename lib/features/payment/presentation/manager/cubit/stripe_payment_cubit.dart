import 'package:bloc/bloc.dart';
import 'package:ev_charging/features/payment/data/models/payment_intent_input_model.dart';
import 'package:ev_charging/features/payment/data/repos/payment_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_payment_state.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.paymentRepo) : super(StripePaymentInitial());

  final PaymentRepo paymentRepo;

  Future makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    emit(StripePaymentLoading());
    var result = await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    result.fold((l) => emit(StripePaymentFailure(l.errMessage)),
        (r) => emit(StripePaymentSuccess()));
  }
}
