class PaymentIntentInputModel {
  final int amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

  toJson() => {
        'amount': amount * 100,
        'currency': currency,
      };
}
