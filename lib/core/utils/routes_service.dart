import 'dart:convert';

import 'package:ev_charging/features/home/data/models/location_info/location_info.dart';
import 'package:ev_charging/features/home/data/models/route_modifiers.dart';
import 'package:ev_charging/features/home/data/models/routes_model/routes_model.dart';
import 'package:http/http.dart' as http;

class RoutesService {
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  final String apiKey = 'AIzaSyD5f2lyiptJ_9ytm2qcEBo9DzSILAXlKBE';
  Future<RoutesModel> fetchRoutes(
      {required LocationInfoModel origin,
      required LocationInfoModel destination,
      RouteModifiers? routeModifiers}) async {
    Uri url = Uri.parse(baseUrl);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': apiKey,
      'X-Goog-FieldMask':
          'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline'
    };

    Map<String, dynamic> body = {
      "origin": origin.toJson(),
      "destination": destination.toJson(),
      "travelMode": "DRIVE",
      "routingPreference": "TRAFFIC_AWARE",
      "computeAlternativeRoutes": false,
      "routeModifiers": routeModifiers != null
          ? routeModifiers.toJson()
          : RouteModifiers().toJson(),
      "languageCode": "en-US",
      "units": "IMPERIAL"
    };

    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return RoutesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load routes');
    }
  }
}
