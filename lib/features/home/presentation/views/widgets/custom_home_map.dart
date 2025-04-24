// import 'package:ev_charging/core/utils/location_service.dart';
// import 'package:ev_charging/core/utils/map_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class CustomHomeMap extends StatefulWidget {
//   const CustomHomeMap({
//     super.key,
//     required this.onMapCreated,
//     required this.polylines,
//     required this.markers,
//     required this.initialCameraPosition,
//   });
//   final Set<Polyline> polylines;
//   final Set<Marker> markers;
//   final CameraPosition initialCameraPosition;
//   final void Function(GoogleMapController)? onMapCreated;

//   @override
//   State<CustomHomeMap> createState() => _CustomHomeMapState();
// }

// class _CustomHomeMapState extends State<CustomHomeMap> {
//   late CameraPosition initialCameraPosition;

//   late MapService mapService;
//   late LatLng destinationPlace;
//   bool isFirstTime = true;
//   late TextEditingController textEditingController;

//   Set<Marker> markers = {};
//   Set<Polyline> polylines = {};
//   late GoogleMapController googleMapController;
//   @override
//   void initState() {
//     initialCameraPosition = const CameraPosition(
//       zoom: 12,
//       target: LatLng(30.045198634574074, 31.231337623727107),
//     );

//     mapService = MapService();

//     initMarkers();
//     updateCurrentLocation();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     googleMapController.dispose();

//     super.dispose();
//   }

//   void setDestinationMarker() {
//     markers.clear();
//     var destinationMarker = Marker(
//       markerId: const MarkerId('destination_marker'),
//       position: destinationPlace,
//     );
//     markers.add(destinationMarker);
//     setState(() {});
//   }

//   initMarkers() {
//     // var stationsMarker =
//     //     const Marker(markerId: MarkerId('1'), position: LatLng(30, 30));
//     // markers.add(stationsMarker);
//   }

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
//       markerId: const MarkerId('my_location_marker'),
//       position: LatLng(locationData.latitude!, locationData.longitude!),
//       infoWindow: const InfoWindow(title: 'My Location'),
//     );
//     markers.add(myLocationMarker);
//     setState(() {});
//   }

//   void updateCurrentLocation() {
//     try {
//       mapService.updateCurrentLocation(
//           onUpdateCurrentLocation: () {
//             setState(() {});
//           },
//           googleMapController: googleMapController,
//           markers: markers);
//       setState(() {});
//     } on LocationSerViceException catch (e) {
//     } on LocationPermissionException catch (e) {
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       polylines: polylines,
//       zoomControlsEnabled: false,
//       markers: markers,
//       onMapCreated: widget.onMapCreated,
//       cameraTargetBounds: CameraTargetBounds(
//         LatLngBounds(
//           southwest: const LatLng(22.746229517745167, 25.717283684274562),
//           northeast: const LatLng(31.04705343238094, 32.57173866374353),
//         ),
//       ),
//       initialCameraPosition: initialCameraPosition,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomHomeMap extends StatelessWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final void Function(GoogleMapController) onMapCreated;

  const CustomHomeMap({
    super.key,
    required this.initialCameraPosition,
    required this.markers,
    required this.polylines,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      polylines: polylines,
      zoomControlsEnabled: false,
      markers: markers,
      onMapCreated: onMapCreated,
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          southwest: const LatLng(22.746229517745167, 25.717283684274562),
          northeast: const LatLng(31.04705343238094, 32.57173866374353),
        ),
      ),
      initialCameraPosition: initialCameraPosition,
    );
  }
}
