import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                name: 'Bloom Charging Station ',
                address:
                    'the address of the station.the address of the station.',
                availability: '7*24hr',
                distance: 4.8,
                rating: 4.5,
                connection: 'ios',
                points: 8,
                onDirectionTap: () {}),
          );
        });
  }
}
