// import 'package:ev_charging/core/entities/station_entity.dart';
// import 'package:ev_charging/core/utils/app_router.dart';
// import 'package:ev_charging/core/widgets/charging_station.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class StationsListView extends StatelessWidget {
//   const StationsListView({
//     super.key,
//     required this.stations,
//     required this.scrollDirection,
//   });
//   final Axis scrollDirection;
//   final List<StationEntity> stations;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const BouncingScrollPhysics(),
//       scrollDirection: scrollDirection,
//       itemCount: stations.length,
//       itemBuilder: (context, index) {
//         return SizedBox(
//           width: MediaQuery.of(context).size.width * 0.99, // Set width per item
//           child: GestureDetector(
//             onTap: () {
//               GoRouter.of(context)
//                   .push(AppRouter.kStationDetailsView, extra: stations[index]);
//             },
//             child: ChargingStation(
//               stationEntity: stations[index],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
