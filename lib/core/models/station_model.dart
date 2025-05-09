import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/models/charging_types_model.dart';
import 'package:ev_charging/core/models/review_model.dart';

class StationModel {
  final String stationName;
  final num price;
  final String address;
  String? imageUrl;
  final String availability;
  final String code;
  final bool isFeatured;
  final double latitude;
  final double longitude;
  final int availableConnectors;
  bool? isAvailable;
  String rating;
  bool? isActive;
  final List<ReviewModel>? reviews;
  final List<ChargingTypesModel> chargingType;
  StationModel({
    required this.stationName,
    required this.price,
    required this.address,
    this.imageUrl,
    required this.code,
    required this.isFeatured,
    required this.latitude,
    required this.longitude,
    required this.availableConnectors,
    required this.chargingType,
    this.isActive,
    this.isAvailable,
    this.rating = '4',
    this.availability = '24/7',
    this.reviews = const [],
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      stationName: json['stationName'],
      price: json['price'],
      address: json['address'],
      imageUrl: json['imageUrl'],
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
      availability: json['availability'] ?? '24/7',
      chargingType: json['chargingType'] != null
          ? List<ChargingTypesModel>.from(
              (json['chargingType'] as List).map(
                (x) => ChargingTypesModel.fromJson(x),
              ),
            )
          : [],
    );
  }

  StationEntity toEntity() {
    return StationEntity(
      name: stationName,
      price: price,
      address: address,
      imageUrl: imageUrl,
      availability: availability,
      code: code,
      isFeatured: isFeatured,
      latitude: latitude,
      longitude: longitude,
      availableConnectors: availableConnectors,
      // chargingType: chargingType,
      isAvailable: isAvailable,
      rating: rating,
      isActive: isActive,
      reviews: reviews?.map((e) => e.toEntity()).toList() ?? [],
      chargingType: chargingType.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'stationName': stationName,
      'price': price,
      'availability': availability,
      'address': address,
      'imageUrl': imageUrl,
      'code': code,
      'isFeatured': isFeatured,
      'latitude': latitude,
      'longitude': longitude,
      'availableConnectors': availableConnectors,
      'isAvailable': isAvailable,
      'rating': rating,
      'isActive': isActive,
      'chargingType': chargingType.map((e) => e.toJson()).toList(),
      'reviews': reviews?.map((e) => e.toJson()).toList(),
    };
  }
}
