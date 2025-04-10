class PaymentIntentInputModel {
  final int amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});

  toJson() => {
        'amount': amount * 100,
        'currency': currency,
        'customer': customerId,
      };
}
