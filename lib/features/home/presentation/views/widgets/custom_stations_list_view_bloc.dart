import 'package:ev_charging/core/cubits/cubit/stations_cubit.dart';
import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/functions/get_dummy_station.dart';
import 'package:ev_charging/core/utils/app_router.dart';
import 'package:ev_charging/core/widgets/charging_station.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomStationListViewBloc extends StatefulWidget {
  const CustomStationListViewBloc({
    super.key,
    required this.scrollDirection,
  });
  final Axis scrollDirection;

  @override
  State<CustomStationListViewBloc> createState() =>
      _CustomStationListViewBlocState();
}

class _CustomStationListViewBlocState extends State<CustomStationListViewBloc> {
  @override
  void initState() {
    super.initState();
    context.read<StationsCubit>().getStations();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationsCubit, StationsState>(
      builder: (context, state) {
        if (state is StationsSuccess) {
          return StationsListView(
            scrollDirection: widget.scrollDirection,
            stations: state.stations,
          );
        } else if (state is StationsFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Skeletonizer(
            enabled: true,
            child: StationsListView(
              scrollDirection: Axis.vertical,
              stations: getDummyStationsList(),
            ),
          );
        }
      },
    );
  }
}

class StationsListView extends StatelessWidget {
  const StationsListView({
    super.key,
    required this.stations,
    required this.scrollDirection,
  });
  final Axis scrollDirection;
  final List<StationEntity> stations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: scrollDirection,
      itemCount: stations.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.99, // Set width per item
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kStationDetailsView, extra: stations[index]);
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
