import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      //zoom levels :
      //World : 0 => 3
      //Country : 4 => 6
      //City : 10 => 12
      //Streets : 13 => 17
      //buildings : 18 => 20
      zoom: 12,
      target: LatLng(30.045198634574074, 31.231337623727107),
    );

    initMarkers();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  Set<Marker> markers = {};
  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        markers: markers,
        onMapCreated: (controller) {
          googleMapController = controller;
        },
        cameraTargetBounds: CameraTargetBounds(
          LatLngBounds(
            southwest: const LatLng(22.746229517745167, 25.717283684274562),
            northeast: const LatLng(31.04705343238094, 32.57173866374353),
          ),
        ),
        initialCameraPosition: initialCameraPosition);
  }

  void initMarkers() {
    var stationsMarker = const Marker(
        markerId: MarkerId('1'),
        position: LatLng(22.746229517745167, 25.717283684274562));
    markers.add(stationsMarker);
  }
}
