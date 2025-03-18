import 'dart:async';

import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/location_service.dart';
import 'package:ev_charging/core/utils/map_service.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:ev_charging/features/favourite/presentation/widgets/favourite_view_body.dart';

import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:ev_charging/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:ev_charging/features/home/presentation/widgets/custom_stations_list_view.dart';
import 'package:ev_charging/features/home/presentation/widgets/predections_list_view.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

String? sessionToken;

class _HomeViewBodyState extends State<HomeViewBody> {
  late CameraPosition initialCameraPosition;
  bool isFirstTime = true;
  late MapService mapService;
  late LatLng destinationPlace;

  late TextEditingController textEditingController;

  List<PlaceAutocompleteModel> places = [];
  late Uuid uuid;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  late GoogleMapController googleMapController;

  Timer? debounce;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      zoom: 12,
      target: LatLng(30.045198634574074, 31.231337623727107),
    );

    mapService = MapService();
    uuid = const Uuid();
    textEditingController = TextEditingController();

    initMarkers();
    updateCurrentLocation();
    fetchPredections();
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    textEditingController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          polylines: polylines,
          zoomControlsEnabled: false,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            updateCurrentLocation();
          },
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              southwest: const LatLng(22.746229517745167, 25.717283684274562),
              northeast: const LatLng(31.04705343238094, 32.57173866374353),
            ),
          ),
          initialCameraPosition: initialCameraPosition,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/Designer (1).jpeg',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ramy Isaac',
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'find your nearest charging point ',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: kSecondaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          CustomSearchBar(
                            textEditingController: textEditingController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          PredectionsListView(
                            onDestinationMarkerSelected: setDestinationMarker,
                            onPlaceSelected: (placeDetailsModel) async {
                              textEditingController.clear();
                              places.clear();
                              sessionToken = null;
                              setState(() {});
                              destinationPlace = LatLng(
                                  placeDetailsModel.geometry!.location!.lat!,
                                  placeDetailsModel.geometry!.location!.lng!);
                              var points = await mapService.getRouteData(
                                  destinationPlace: destinationPlace);
                              mapService.displayRoutes(points,
                                  polylines: polylines,
                                  googleMapController: googleMapController);
                              setState(() {});
                            },
                            places: places,
                            mapServices: mapService,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_rounded),
                        color: kSecondaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        const CustomStationsListView(),
      ],
    );
  }

  void setDestinationMarker() {
    markers.clear();
    var destinationMarker = Marker(
      markerId: const MarkerId('destination_marker'),
      position: destinationPlace,
    );
    markers.add(destinationMarker);
    setState(() {});
  }

  initMarkers() {
    // var stationsMarker =
    //     const Marker(markerId: MarkerId('1'), position: LatLng(30, 30));
    // markers.add(stationsMarker);
  }

  void updateMyCamera(LocationData locationData) {
    if (isFirstTime) {
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 13,
      );
      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstTime = false;
    } else {
      googleMapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(locationData.latitude!, locationData.longitude!),
        ),
      );
    }
  }

  void setMyLocationMarker(LocationData locationData) {
    var myLocationMarker = Marker(
      markerId: const MarkerId('my_location_marker'),
      position: LatLng(locationData.latitude!, locationData.longitude!),
      infoWindow: const InfoWindow(title: 'My Location'),
    );
    markers.add(myLocationMarker);
    setState(() {});
  }

  void updateCurrentLocation() {
    try {
      mapService.updateCurrentLocation(
          onUpdateCurrentLocation: () {
            setState(() {});
          },
          googleMapController: googleMapController,
          markers: markers);
      setState(() {});
    } on LocationSerViceException catch (e) {
    } on LocationPermissionException catch (e) {
    } catch (e) {}
  }

  void fetchPredections() {
    textEditingController.addListener(() {
      if (debounce?.isActive ?? false) {
        debounce?.cancel();
      }
      debounce = Timer(const Duration(milliseconds: 50), () async {
        sessionToken ??= uuid.v4();
        await mapService.getPredections(
            input: textEditingController.text,
            sessionToken: sessionToken!,
            places: places);
        setState(() {});
      });
    });
  }
}
