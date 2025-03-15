import 'dart:math';

import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/places_service.dart';
import 'package:ev_charging/core/utils/location_service.dart';
import 'package:ev_charging/core/utils/routes_service.dart';
import 'package:ev_charging/features/home/data/models/location_info/lat_lng.dart';
import 'package:ev_charging/features/home/data/models/location_info/location.dart';
import 'package:ev_charging/features/home/data/models/location_info/location_info.dart';
import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:ev_charging/features/home/data/models/place_details_model/place_details_model.dart';
import 'package:ev_charging/features/home/data/models/routes_model/routes_model.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {
  PlacesService placesService = PlacesService();
  LocationService locationService = LocationService();
  RoutesService routesService = RoutesService();
  LatLng? currentLocation;

  Future<void> getPredections(
      {required String input,
      required String sessionToken,
      required List<PlaceAutocompleteModel> places}) async {
    if (input.isNotEmpty) {
      var result = await placesService.getPlacePredictions(
        sessionToken: sessionToken,
        input: input,
      );

      places.clear();
      places.addAll(result);
    } else {
      places.clear();
    }
  }

  Future<List<LatLng>> getRouteData({required LatLng destinationPlace}) async {
    LocationInfoModel origin = LocationInfoModel(
      location: LocationModel(
          latLng: LatLngModel(
              latitude: currentLocation!.latitude,
              longitude: currentLocation!.longitude)),
    );
    LocationInfoModel destination = LocationInfoModel(
      location: LocationModel(
        latLng: LatLngModel(
            latitude: destinationPlace.latitude,
            longitude: destinationPlace.longitude),
      ),
    );
    var routes = await routesService.fetchRoutes(
        origin: origin, destination: destination);
    return decodeRoute(routes);
  }

  List<LatLng> decodeRoute(RoutesModel routes) {
    PolylinePoints polylinePoints = PolylinePoints();

    List<PointLatLng> result = polylinePoints
        .decodePolyline(routes.routes!.first.polyline!.encodedPolyline!);

    return result.map((e) => LatLng(e.latitude, e.longitude)).toList();
  }

  void displayRoutes(List<LatLng> points,
      {required Set<Polyline> polylines,
      required GoogleMapController googleMapController}) {
    Polyline route = Polyline(
      polylineId: const PolylineId('route'),
      points: points,
      color: kSecondaryColor,
      width: 6,
    );
    polylines.add(route);

    LatLngBounds bounds = getLatLngBounds(points);
    googleMapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        bounds,
        16,
      ),
    );
  }

  LatLngBounds getLatLngBounds(List<LatLng> points) {
    var southwestLatitude = points.first.latitude;
    var southwestLongitude = points.first.longitude;
    var northeastLatitude = points.last.latitude;
    var northeastLongitude = points.last.longitude;

    for (var point in points) {
      southwestLatitude = min(southwestLatitude, point.latitude);
      southwestLongitude = min(southwestLongitude, point.longitude);
      northeastLatitude = max(northeastLatitude, point.latitude);
      northeastLongitude = max(northeastLongitude, point.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(southwestLatitude, southwestLongitude),
      northeast: LatLng(northeastLatitude, northeastLongitude),
    );
  }

  void updateCurrentLocation(
      {required Set<Marker> markers,
      required GoogleMapController googleMapController,
      required Function onUpdateCurrentLocation}) {
    locationService.getRealTimeData((locationData) {
      currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
      Marker myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: currentLocation!,
      );
      CameraPosition myCurrentcameraPosition = CameraPosition(
        target: currentLocation!,
        zoom: 15,
      );
      googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(myCurrentcameraPosition));
      markers.add(myLocationMarker);
      onUpdateCurrentLocation();
    });
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    return await placesService.getPlaceDetails(
      placeId: placeId,
    );
  }
}
