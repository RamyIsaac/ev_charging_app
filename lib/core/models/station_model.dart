import 'dart:io';

import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/models/review_model.dart';

class StationModel {
  final String stationName;
  final num price;
  final String address;
  String? imageUrl;
  final File image;
  final String code;
  final bool isFeatured;
  final double latitude;
  final double longitude;
  final int availableConnectors;
  bool? isAvailable;
  num rating;
  bool? isActive;
  final List<ReviewModel>? reviews;

  StationModel({
    required this.stationName,
    required this.price,
    required this.address,
    this.imageUrl,
    required this.image,
    required this.code,
    required this.isFeatured,
    required this.latitude,
    required this.longitude,
    required this.availableConnectors,
    //  required this.chargingType,
    this.isActive,
    this.isAvailable,
    this.rating = 0,
    this.reviews,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      stationName: json['stationName'],
      price: json['price'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      image: json['image'] as File,
      code: json['code'],
      isFeatured: json['isFeatured'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      availableConnectors: json['availableConnectors'],
      isAvailable: json['isAvailable'],
      rating: json['rating'],
      isActive: json['isActive'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map(
                (x) => ReviewModel.fromJson(x),
              ),
            )
          : [],
    );
  }

  toJson() {
    return {
      'stationName': stationName,
      'price': price,
      'address': address,
      'imageUrl': imageUrl,
      // 'image': image,
      'code': code,
      'isFeatured': isFeatured,
      'latitude': latitude,
      'longitude': longitude,
      'availableConnectors': availableConnectors,
      // 'chargingType': chargingType,
      'isAvailable': isAvailable,
      'rating': rating,
      'isActive': isActive,

      'reviews': reviews?.map((e) => e.toJson()).toList(),
    };
  }
}
