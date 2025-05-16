import 'package:ev_charging/core/services/location_service.dart';
import 'package:ev_charging/core/services/routes_service.dart';
import 'package:ev_charging/features/home/presentation/views/widgets/custom_stations_list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    LocationService locationService = LocationService();
    RoutesService routeService = RoutesService();
    return StationsListView(
      scrollDirection: Axis.vertical,
      locationService: locationService,
      routeService: routeService,
      onRouteUpdated: (Set<Polyline> updatedPolylines) {
        // Handle the updated routes here (update state or something)
        print("Updated polylines: $updatedPolylines");
      },
    );
  }
}

class StationsListView extends StatelessWidget {
  const StationsListView({
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
    return CustomStationListViewBloc(
      locationService: locationService,
      routeService: routeService,
      onRouteUpdated: onRouteUpdated,
      scrollDirection: scrollDirection,
    );
  }
}




//ListView.builder(
    //     scrollDirection: scrollDirection,
    //     itemCount: 10,
    //     itemBuilder: (context, index) {
    //       return GestureDetector(
    //           onTap: () {
    //             GoRouter.of(context).push(AppRouter.kStationDetailsView);
    //           },
    //           child: ChargingStation(
    //             stationEntity: StationEntity(
    //               name: 'name',
    //               address: 'address',
    //               imageUrl: 'imageUrl',
    //               longitude: 0.0,
    //               latitude: 0.0,
    //               isActive: true,
    //               rating: '5',
    //               availableConnectors: 8,
    //               price: 0,
    //               code: '',
    //               isFeatured: false,
    //               reviews: [],
    //               chargingType: [],
    //             ),
    //           ));
    //     });