import 'package:ev_charging/core/entities/charging_types_entity.dart';
import 'package:ev_charging/core/entities/review_entity.dart';

class StationEntity {
  final String name;
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
  final List<ReviewEntity> reviews;
  final List<ChargingTypesEntity> chargingType;

  StationEntity({
    required this.name,
    required this.price,
    required this.address,
    this.imageUrl,
    required this.code,
    required this.isFeatured,
    required this.latitude,
    required this.longitude,
    required this.availableConnectors,
    this.availability = '24/7',
    //  required this.chargingType,
    this.isActive,
    this.isAvailable,
    required this.rating,
    required this.reviews,
    required this.chargingType,
  });
}
