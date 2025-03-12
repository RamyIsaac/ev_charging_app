import 'address_component.dart';
import 'geometry.dart';
import 'opening_hours.dart';
import 'photo.dart';
import 'plus_code.dart';
import 'review.dart';

class Result {
  List<AddressComponent>? addressComponents;
  String? adrAddress;
  String? businessStatus;
  String? formattedAddress;
  String? formattedPhoneNumber;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? internationalPhoneNumber;
  String? name;
  OpeningHours? openingHours;
  List<Photo>? photos;
  String? placeId;
  PlusCode? plusCode;
  int? rating;
  String? reference;
  List<Review>? reviews;

  Result({
    this.addressComponents,
    this.adrAddress,
    this.businessStatus,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.internationalPhoneNumber,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.rating,
    this.reference,
    this.reviews,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: (json['address_components'] as List<dynamic>?)
            ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
            .toList(),
        adrAddress: json['adr_address'] as String?,
        businessStatus: json['business_status'] as String?,
        formattedAddress: json['formatted_address'] as String?,
        formattedPhoneNumber: json['formatted_phone_number'] as String?,
        geometry: json['geometry'] == null
            ? null
            : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
        icon: json['icon'] as String?,
        iconBackgroundColor: json['icon_background_color'] as String?,
        iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
        internationalPhoneNumber: json['international_phone_number'] as String?,
        name: json['name'] as String?,
        openingHours: json['opening_hours'] == null
            ? null
            : OpeningHours.fromJson(
                json['opening_hours'] as Map<String, dynamic>),
        photos: (json['photos'] as List<dynamic>?)
            ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList(),
        placeId: json['place_id'] as String?,
        plusCode: json['plus_code'] == null
            ? null
            : PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
        rating: json['rating'] as int?,
        reference: json['reference'] as String?,
        reviews: (json['reviews'] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'address_components':
            addressComponents?.map((e) => e.toJson()).toList(),
        'adr_address': adrAddress,
        'business_status': businessStatus,
        'formatted_address': formattedAddress,
        'formatted_phone_number': formattedPhoneNumber,
        'geometry': geometry?.toJson(),
        'icon': icon,
        'icon_background_color': iconBackgroundColor,
        'icon_mask_base_uri': iconMaskBaseUri,
        'international_phone_number': internationalPhoneNumber,
        'name': name,
        'opening_hours': openingHours?.toJson(),
        'photos': photos?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        'plus_code': plusCode?.toJson(),
        'rating': rating,
        'reference': reference,
        'reviews': reviews?.map((e) => e.toJson()).toList(),
      };
}
