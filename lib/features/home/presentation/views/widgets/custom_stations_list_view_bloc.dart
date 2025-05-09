import 'package:ev_charging/core/cubits/cubit/stations_cubit.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomStationListViewBloc extends StatelessWidget {
  const CustomStationListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationsCubit, StationsState>(
      builder: (context, state) {
        if (state is StationsSuccess) {
          return StationsListView(
            stations: state.stations,
          );
        } else if (state is StationsFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

class StationsListView extends StatelessWidget {
  const StationsListView({
    super.key,
    required this.stations,
  });

  final List<StationEntity> stations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.99, // Set width per item
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kStationDetailsView);
            },
            child: ChargingStation(
              stationEntity: stations[index],
            ),
          ),
        );
      },
    );
  }
}
