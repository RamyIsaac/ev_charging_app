import 'details.dart';

class AmountPaypalModel {
  String? total;
  String? currency;
  Details? details;

  AmountPaypalModel({this.total, this.currency, this.details});

  factory AmountPaypalModel.fromJson(Map<String, dynamic> json) {
    return AmountPaypalModel(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
}
