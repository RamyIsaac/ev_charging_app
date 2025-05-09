// import 'package:ev_charging/core/services/database_service.dart';
// import 'package:ev_charging/core/utils/backend_end_points.dart';

// final List<Map<String, dynamic>> cairoStations = [
//   {
//     "stationName": "New Cairo EV Hub",
//     "price": 0,
//     "address": "New Cairo, Cairo Governorate, Egypt",
//     "imageUrl": "",
//     "code": "CAIRO001",
//     "isFeatured": true,
//     "latitude": 30.0150,
//     "longitude": 31.4913,
//     "availableConnectors": 4,
//     "isAvailable": true,
//     "isActive": true,
//     "rating": "4.5",
//     "chargingType": {
//       "chargingTypes": ["Type 2", "CCS"]
//     },
//     "reviews": [],
//   },
//   {
//     "stationName": "Nasr City Charging Point",
//     "price": 0,
//     "address": "Nasr City, Cairo, Egypt",
//     "imageUrl": "",
//     "code": "CAIRO002",
//     "isFeatured": false,
//     "latitude": 30.0561,
//     "longitude": 31.3300,
//     "availableConnectors": 3,
//     "isAvailable": true,
//     "isActive": true,
//     "rating": "4.0",
//     "chargingType": {
//       "chargingTypes": ["CHAdeMO"]
//     },
//     "reviews": [],
//   },
//   // Add more stations if you like...
// ];

// Future<void> uploadStationsToFirestore(DatabaseService databaseService) async {
//   for (var station in cairoStations) {
//     try {
//       await databaseService.addData(
//         path: BackendEndPoints.stations,
//         data: station,
//         documentId: station["code"], // optional, avoids duplication
//       );
//       print("✅ Uploaded station: ${station["stationName"]}");
//     } catch (e) {
//       print("❌ Failed to upload ${station["stationName"]}: $e");
//     }
//   }
// }
