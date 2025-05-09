import 'package:ev_charging/features/home/presentation/views/widgets/custom_stations_list_view_bloc.dart';
import 'package:flutter/material.dart';

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
    return const CustomStationListViewBloc(
      scrollDirection: Axis.vertical,
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