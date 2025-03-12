import 'result.dart';

class PlaceDetailsModel {
  List<dynamic>? htmlAttributions;
  Result? result;

  PlaceDetailsModel({this.htmlAttributions, this.result});

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) {
    return PlaceDetailsModel(
      htmlAttributions: json['html_attributions'] as List<dynamic>?,
      result: json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'html_attributions': htmlAttributions,
        'result': result?.toJson(),
      };
}
