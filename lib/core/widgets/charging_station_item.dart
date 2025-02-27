// import 'package:ev_charging/constants.dart';
// import 'package:flutter/material.dart';

// class ChargingStationItem extends StatelessWidget {
//   const ChargingStationItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
//       child: SizedBox(
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height * 0.213,
//         child: const Card(
//           elevation: 6,
//           child: Row(
//             children: [
//               StationImage(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   StationName(),
//                   StationAddress(),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   StationInfo(),
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Text('Connections'),
//                           Text('8 points'),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 12,
//                       ),
//                       CustomStationButton(),
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StationAddress extends StatelessWidget {
//   const StationAddress({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Station Address, ',
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(color: Colors.grey),
//     );
//   }
// }

// class StationName extends StatelessWidget {
//   const StationName({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Station Name ',
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//     );
//   }
// }

// class StationImage extends StatelessWidget {
//   const StationImage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: ClipRRect(
//         child: AspectRatio(
//           aspectRatio: 1,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               image: const DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage('assets/images/charging_cars.webp'),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class StationInfo extends StatelessWidget {
//   const StationInfo(
//       {super.key,
//       this.stationName,
//       this.stationAddress,
//       this.openTime,
//       this.distanceToReach,
//       this.rating,
//       this.numberOfSlots});
//   final String? stationName;
//   final String? stationAddress;
//   final DateTime? openTime;
//   final double? distanceToReach;
//   final double? rating;
//   final int? numberOfSlots;
//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         Row(
//           children: [
//             Icon(Icons.access_time_filled_sharp),
//             Text(' 24*7hr'),
//           ],
//         ),
//         SizedBox(
//           width: 6,
//         ),
//         Row(
//           children: [
//             Icon(Icons.location_on_rounded),
//             Text(' 2.5 km'),
//           ],
//         ),
//         SizedBox(
//           width: 6,
//         ),
//         Row(
//           children: [
//             Icon(Icons.star),
//             Text('4.5'),
//           ],
//         )
//       ],
//     );
//   }
// }

// class CustomStationButton extends StatelessWidget {
//   const CustomStationButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: kSecondaryColor, borderRadius: BorderRadius.circular(10)),
//       height: 40,
//       width: 110,
//       child: const Center(
//           child: Text(
//         'Get direction',
//         style: TextStyle(color: Colors.white),
//       )),
//     );
//   }
// }
