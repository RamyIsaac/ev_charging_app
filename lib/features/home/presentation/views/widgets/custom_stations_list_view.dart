import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:ev_charging/features/home/presentation/manager/cubit/charging_station_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: const CustomStationListViewBloc(),
      ),
    );
  }
}

class CustomStationListViewBloc extends StatelessWidget {
  const CustomStationListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChargingStationCubit, ChargingStationState>(
      builder: (context, state) {
        if (state is ChargingStationSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: state.chargingStations.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.99, // Set width per item
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kStationDetailsView);
                  },
                  child: ChargingStation(
                    chargingStationModel: state.chargingStations[index],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: kSecondaryColor,
          ));
        }
      },
    );
  }
}
