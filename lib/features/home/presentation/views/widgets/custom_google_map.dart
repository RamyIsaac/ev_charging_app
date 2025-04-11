// import 'package:ev_charging/constants.dart';
// import 'package:ev_charging/core/utils/location_service.dart';
// import 'package:ev_charging/core/utils/routes_service.dart';
// import 'package:ev_charging/features/home/data/models/location_info/lat_lng.dart';
// import 'package:ev_charging/features/home/data/models/location_info/location.dart';
// import 'package:ev_charging/features/home/data/models/location_info/location_info.dart';
// import 'package:ev_charging/features/home/data/models/routes_model/route.dart';
// import 'package:ev_charging/features/home/data/models/routes_model/routes_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class CustomGoogleMap extends StatefulWidget {
//   const CustomGoogleMap({super.key});

//   @override
//   State<CustomGoogleMap> createState() => _CustomGoogleMapState();
// }

// class _CustomGoogleMapState extends State<CustomGoogleMap> {
//   late CameraPosition initialCameraPosition;
//   bool isFirstTime = true;
//   late LocationService locationService;
//   late LatLng destinationPlace;
//   late LatLng currentLocation;
//   late RoutesService routesService;
//   @override
//   void initState() {
//     initialCameraPosition = const CameraPosition(
//       //zoom levels :
//       //World : 0 => 3
//       //Country : 4 => 6
//       //City : 10 => 12
//       //Streets : 13 => 17
//       //buildings : 18 => 20
//       zoom: 12,
//       target: LatLng(30.045198634574074, 31.231337623727107),
//     );
//     routesService = RoutesService();
//     locationService = LocationService();
//     initMarkers();
//     updateCurrentLocation();
//     // updateMyLocation();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     googleMapController.dispose();
//     super.dispose();
//   }

//   Set<Marker> markers = {};
//   Set<Polyline> polylines = {};
//   late GoogleMapController googleMapController;

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       polylines: polylines,
//         zoomControlsEnabled: false,
//         markers: markers,
//         onMapCreated: (controller) {
//           googleMapController = controller;
//           updateCurrentLocation();
//         },
//         cameraTargetBounds: CameraTargetBounds(
//           LatLngBounds(
//             southwest: const LatLng(22.746229517745167, 25.717283684274562),
//             northeast: const LatLng(31.04705343238094, 32.57173866374353),
//           ),
//         ),
//         initialCameraPosition: initialCameraPosition);
//   }

//   void initMarkers() {
//     var stationsMarker = const Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(22.746229517745167, 25.717283684274562));
//     markers.add(stationsMarker);
//   }

//   // void updateMyLocation() async {
//   //   await locationService.checkAndRequestLocatonService();
//   //   var hasPermission =
//   //       await locationService.checkAndRequestLocatonPermission();
//   //   if (hasPermission ) {
//   //     locationService.getRealTimeData((locationData) {
//   //       setMyLocationMarker(locationData);
//   //       updateMyCamera(locationData);
//   //     });
//   //   } else {}
//   // }

//   void updateMyCamera(LocationData locationData) {
//     if (isFirstTime) {
//       CameraPosition cameraPosition = CameraPosition(
//         target: LatLng(locationData.latitude!, locationData.longitude!),
//         zoom: 13,
//       );
//       googleMapController
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//       isFirstTime = false;
//     } else {
//       googleMapController.animateCamera(
//         CameraUpdate.newLatLng(
//           LatLng(locationData.latitude!, locationData.longitude!),
//         ),
//       );
//     }
//   }

//   void setMyLocationMarker(LocationData locationData) {
//     var myLocationMarker = Marker(
//         markerId: const MarkerId('my_location_marker'),
//         position: LatLng(locationData.latitude!, locationData.longitude!));
//     markers.add(myLocationMarker);
//     setState(() {});
//   }

//   Future<void> updateCurrentLocation() async {
//     try {
//       var locationData = await locationService.getLocation();
//       currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
//       Marker myLocationMarker = Marker(
//         markerId: const MarkerId('my_location_marker'),
//         position: currentLocation,
//       );
//       markers.add(myLocationMarker);
//       setState(() {});
//       CameraPosition myCurrentcameraPosition = CameraPosition(
//         target: currentLocation,
//         zoom: 15,
//       );
//       googleMapController.animateCamera(
//           CameraUpdate.newCameraPosition(myCurrentcameraPosition));
//     } on LocationSerViceException catch (e) {
//       // TODO
//     } on LocationPermissionException catch (e) {
//     } catch (e) {}
//   }

//   Future<List<LatLng>> getRouteData() async {
//     LocationInfoModel origin = LocationInfoModel(
//       location: LocationModel(
//           latLng: LatLngModel(
//               latitude: currentLocation.latitude,
//               longitude: currentLocation.longitude)),
//     );
//     LocationInfoModel destination = LocationInfoModel(
//       location: LocationModel(
//         latLng: LatLngModel(
//             latitude: destinationPlace.latitude,
//             longitude: currentLocation.longitude),
//       ),
//     );
//     var routes = await routesService.fetchRoutes(
//         origin: origin, destination: destination);
//     return decodeRoute(routes);
//   }

//   List<LatLng> decodeRoute(RoutesModel routes) {
//     PolylinePoints polylinePoints = PolylinePoints();

//     List<PointLatLng> result = polylinePoints
//         .decodePolyline(routes.routes!.first.polyline!.encodedPolyline!);

//     return result.map((e) => LatLng(e.latitude, e.longitude)).toList();
//   }

//    void displayRoutes(List<LatLng> points) {
//     Polyline route = Polyline(
//       polylineId: const PolylineId('route'),
//       points: points,
//       color: kSecondaryColor,
//       width: 6,
//     );
//     polylines.add(route);
//     setState(() {});
//   }
// }
