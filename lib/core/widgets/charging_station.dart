import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/services/location_service.dart';
import 'package:ev_charging/core/services/routes_service.dart';
import 'package:ev_charging/features/home/data/models/location_info/lat_lng.dart';
import 'package:ev_charging/features/home/data/models/location_info/location.dart';
import 'package:ev_charging/features/home/data/models/location_info/location_info.dart';
//import 'package:ev_charging/features/home/data/models/routes_model/polyline.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChargingStation extends StatelessWidget {
  final StationEntity stationEntity;

  final LocationService locationService;
  final RoutesService routeService;
  final Function(Set<Polyline>) onRouteUpdated;

  const ChargingStation(
      {super.key,
      required this.stationEntity,
      required this.locationService,
      required this.routeService,
      required this.onRouteUpdated});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: const AssetImage('assets/images/charging_cars.webp'),
                    width: screenWidth * 0.22,
                    height: screenWidth * 0.22,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stationEntity.name,
                        style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        stationEntity.address,
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: screenWidth * 0.035),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      StationTimeDistanceRating(
                          availability: stationEntity.availability,
                          screenWidth: screenWidth,
                          distance:
                              stationEntity.availableConnectors.toDouble(),
                          rating: stationEntity.rating),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        "Types: ${stationEntity.chargingType.expand((ct) => ct.chargingTypes).join(', ')}",
                        style: TextStyle(
                            fontSize: screenWidth * 0.0325,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      "${stationEntity.availableConnectors} points",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035, color: Colors.blue),
                    ),
                  ],
                ),
                const Spacer(),
                getDirectionButton(screenWidth),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton getDirectionButton(double screenWidth) {
    return ElevatedButton(
      onPressed: () async {
        try {
          final currentPosition = await locationService.getLocation();

          final directions = await routeService.fetchRoutes(
            origin: LocationInfoModel(
              location: LocationModel(
                latLng: LatLngModel(
                  latitude: currentPosition.latitude,
                  longitude: currentPosition.longitude,
                ),
              ),
            ),
            destination: LocationInfoModel(
              location: LocationModel(
                latLng: LatLngModel(
                  latitude: stationEntity.latitude,
                  longitude: stationEntity.longitude,
                ),
              ),
            ),
          );

          final encodedPolyline =
              directions.routes?.first.polyline?.encodedPolyline;

          if (encodedPolyline != null) {
            List<LatLng> polylineCoordinates = _decodePolyline(encodedPolyline);

            Set<Polyline> polylines = {
              Polyline(
                polylineId: const PolylineId('route'),
                points: polylineCoordinates,
                color: kSecondaryColor,
                width: 5,
              ),
            };

            onRouteUpdated(polylines);
          } else {
            print('No polyline data found in the route');
          }
        } catch (e) {
          print('Error: $e');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kSecondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.025, horizontal: screenWidth * 0.05),
      ),
      child: Text("Get direction",
          style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.035)),
    );
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index) - 63;
        index++;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 0x1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index) - 63;
        index++;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 0x1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polyline.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return polyline;
  }
}

class StationTimeDistanceRating extends StatelessWidget {
  const StationTimeDistanceRating({
    super.key,
    required this.availability,
    required this.screenWidth,
    required this.distance,
    required this.rating,
  });

  final String availability;
  final double screenWidth;
  final double distance;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.centerLeft,
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          const Icon(Icons.access_time, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text(availability, style: TextStyle(fontSize: screenWidth * 0.035)),
          const SizedBox(width: 8),
          const Icon(Icons.location_on, size: 14, color: Colors.grey),
          const SizedBox(width: 4),
          Text("$distance km", style: TextStyle(fontSize: screenWidth * 0.035)),
          const SizedBox(width: 8),
          const Icon(Icons.star, size: 14, color: Colors.amber),
          const SizedBox(width: 4),
          Text(rating, style: TextStyle(fontSize: screenWidth * 0.035)),
        ],
      ),
    );
  }
}
