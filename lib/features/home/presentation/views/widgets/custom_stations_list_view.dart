import 'package:ev_charging/core/services/location_service.dart';
import 'package:ev_charging/core/services/routes_service.dart';
import 'package:ev_charging/features/home/presentation/views/widgets/custom_stations_list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomStationsListView extends StatelessWidget {
  const CustomStationsListView({
    super.key,
    required this.scrollDirection,
    required this.locationService,
    required this.routeService,
    required this.onRouteUpdated,
  });
  final Axis scrollDirection;
  final LocationService locationService;
  final RoutesService routeService;
  final Function(Set<Polyline>) onRouteUpdated;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20, // Adjust positioning as needed
      left: 0,
      right: 0,

      height: 190, // Give it a fixed height
      child: SizedBox(
        height:
            MediaQuery.of(context).size.height * 0.3, // Ensure a defined height
        child: CustomStationListViewBloc(
          scrollDirection: scrollDirection,
          locationService: locationService,
          routeService: routeService,
          onRouteUpdated: onRouteUpdated,
        ),
      ),
    );
  }
}
