import 'package:ev_charging/core/entities/charging_types_entity.dart';

class ChargingTypesModel {
  final List<String> chargingTypes;

  ChargingTypesModel({required this.chargingTypes});

  // From JSON (for decoding from API or local storage)
  factory ChargingTypesModel.fromJson(Map<String, dynamic> json) {
    return ChargingTypesModel(
      chargingTypes: List<String>.from(json['chargingTypes'] ?? []),
    );
  }

  // To JSON (for encoding to API or local storage)
  Map<String, dynamic> toJson() {
    return {
      'chargingTypes': chargingTypes,
    };
  }

  // Optional: Convert from Entity
  factory ChargingTypesModel.fromEntity(ChargingTypesEntity entity) {
    return ChargingTypesModel(chargingTypes: entity.chargingTypes);
  }

  // Optional: Convert to Entity
  ChargingTypesEntity toEntity() {
    return ChargingTypesEntity(chargingTypes: chargingTypes);
  }
}
