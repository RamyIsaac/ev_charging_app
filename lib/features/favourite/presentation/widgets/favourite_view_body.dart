import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:flutter/material.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChargingStation(
              name: 'Bloom Charging Station ',
              address: 'the address of the station.the address of the station.',
              availability: '7*24hr',
              distance: 4.8,
              rating: 4.5,
              connection: 'ios',
              points: 8,
              onDirectionTap: () {});
        });
  }
}
