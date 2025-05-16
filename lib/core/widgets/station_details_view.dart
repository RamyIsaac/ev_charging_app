import 'dart:developer';

import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/services/location_service.dart';
import 'package:ev_charging/core/services/routes_service.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/station_details_view_body.dart';
import 'package:ev_charging/features/home/data/models/location_info/lat_lng.dart';
import 'package:ev_charging/features/home/data/models/location_info/location.dart';
import 'package:ev_charging/features/home/data/models/location_info/location_info.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationDetailsView extends StatelessWidget {
  const StationDetailsView({
    super.key,
    required this.station,
    required this.locationService,
    required this.routeService,
    required this.onRouteUpdated,
  });
  final StationEntity station;
  final LocationService locationService;
  final RoutesService routeService;
  final Function(Set<Polyline>) onRouteUpdated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomAppBar(
        stationEntity: station,
        locationService: locationService,
        routeService: routeService,
        onRouteUpdated: onRouteUpdated,
      ),
      body: SafeArea(
          child: StationDetailsViewBody(
        station: station,
      )),
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    required this.locationService,
    required this.routeService,
    required this.onRouteUpdated,
    required this.stationEntity,
  });
  final LocationService locationService;
  final RoutesService routeService;
  final Function(Set<Polyline>) onRouteUpdated;
  final StationEntity stationEntity;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomBottomButton(
              backgroundColor: const WidgetStatePropertyAll(kSecondaryColor),
              text: 'Book Now',
              textColor: Colors.white,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kBookingDetailsView);
              },
            ),
            CustomBottomButton(
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
                    List<LatLng> polylineCoordinates =
                        _decodePolyline(encodedPolyline);

                    Set<Polyline> polylines = {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: polylineCoordinates,
                        color: kSecondaryColor,
                        width: 5,
                      ),
                    };

                    onRouteUpdated(polylines);
                    GoRouter.of(context).pop();
                  } else {
                    log('No polyline data found in the route');
                  }
                } catch (e) {
                  log('Error: $e');
                }
              },
              textColor: Colors.black,
              text: "Get Direction",
            ),
          ],
        ),
      ),
    );
  }
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

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.child,
  });
  final String text;
  final void Function()? onPressed;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                backgroundColor ?? const WidgetStatePropertyAll(Colors.white),
            fixedSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width * 0.4, 50),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )),
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(color: textColor ?? Colors.black, fontSize: 16)));
  }
}
