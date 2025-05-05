class ChargingStationModel {
  int id;
  String name;
  String address;
  String city;
  String state;
  String zipCode;
  String imageUrl;
  double longitude;
  double latitude;
  bool isActive;
  String rating;
  int availableConnectors;
  String operatingHours;
  String createdAt;

  ChargingStationModel({
    this.id = 0,
    required this.name,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.imageUrl,
    required this.longitude,
    required this.latitude,
    required this.isActive,
    required this.rating,
    required this.availableConnectors,
    required this.operatingHours,
    required this.createdAt,
  });

  static ChargingStationModel fromJson(Map<String, dynamic> json) =>
      ChargingStationModel(
        name: json['Name'] ?? "",
        id: json['Id'] ?? 0,
        address: json['Address'] ?? "",
        city: json['City'] ?? "",
        state: json['State'] ?? "",
        zipCode: json['ZipCode'] ?? "",
        imageUrl: json['ImageUrl'] ?? "",
        longitude: json['Longitude'] ?? 0.0,
        latitude: json['Latitude'] ?? 0.0,
        isActive: json['IsActive'] ?? false,
        rating: json['rating'] ?? "",
        availableConnectors: json['availableConnectors'] ?? 0,
        operatingHours: json['operatingHours'] ?? "",
        createdAt: json['CreatedAt'] ?? "",
      );
  Map<String, dynamic> toJson() => {
        'Id': id,
        'Name': name,
        'Address': address,
        'City': city,
        'State': state,
        'ZipCode': zipCode,
        'ImageUrl': imageUrl,
        'Longitude': longitude,
        'Latitude': latitude,
        'IsActive': isActive,
        'rating': rating,
        'availableConnectors': availableConnectors,
        'operatingHours': operatingHours,
        'CreatedAt': createdAt,
      };
}
