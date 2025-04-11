import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomStationsListView extends StatelessWidget {
  const CustomStationsListView({
    super.key,
  });

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
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.99, // Set width per item
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kStationDetailsView);
                },
                child: ChargingStation(
                  name: 'Bloom Charging Station',
                  address: 'The address of the station.',
                  availability: '7*24hr',
                  distance: 4.8,
                  rating: 4.5,
                  connection: 'iOS',
                  points: 8,
                  onDirectionTap: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
