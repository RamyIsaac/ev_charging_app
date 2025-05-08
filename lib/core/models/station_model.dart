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
  num rating = 0;
  bool? isActive;
  final List<ReviewModel> reviews;

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
    required this.rating,
    required this.reviews,
  });

  factory StationModel.fromEntity(StationEntity entity) {
    return StationModel(
      stationName: entity.name,
      price: entity.price,
      address: entity.address,
      imageUrl: entity.imageUrl,
      image: entity.image,
      code: entity.code,
      isFeatured: entity.isFeatured,
      latitude: entity.latitude,
      longitude: entity.longitude,
      availableConnectors: entity.availableConnectors,
      isAvailable: entity.isAvailable,
      rating: entity.rating,
      isActive: entity.isActive,
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      // chargingType: entity.chargingType,
    );
  }

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
      reviews: json['reviews'],
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

      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
