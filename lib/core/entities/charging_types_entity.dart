class ChargingTypesEntity {
  final List<String> chargingTypes;

  ChargingTypesEntity({required this.chargingTypes});

  factory ChargingTypesEntity.fromJson(Map<String, dynamic> json) {
    return ChargingTypesEntity(
      chargingTypes: List<String>.from(json['chargingTypes']),
    );
  }
}
