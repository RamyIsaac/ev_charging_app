import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:ev_charging/features/home/data/models/charging_station_model/charging_station_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const StationsListView(scrollDirection: Axis.vertical);
  }
}

class StationsListView extends StatelessWidget {
  const StationsListView({
    super.key,
    required this.scrollDirection,
  });
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kStationDetailsView);
              },
              child: ChargingStation(
                chargingStationModel: ChargingStationModel(
                  name: 'name',
                  address: 'address',
                  city: 'city',
                  state: 'state',
                  zipCode: 'zipCode',
                  imageUrl: 'imageUrl',
                  longitude: 0.0,
                  latitude: 0.0,
                  isActive: true,
                  rating: '5',
                  availableConnectors: 8,
                  operatingHours: '24/7',
                  createdAt: TimeOfDay.now().toString(),
                ),
              ));
        });
  }
}
