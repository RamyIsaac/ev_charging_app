import 'item.dart';

class ItemsPaypalModel {
  List<Item>? items;

  ItemsPaypalModel({this.items});

  factory ItemsPaypalModel.fromJson(Map<String, dynamic> json) {
    return ItemsPaypalModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
