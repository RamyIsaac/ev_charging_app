// import 'package:ev_charging/core/models/booking_data_model.dart';
// import 'package:ev_charging/features/payment/presentation/views/widgets/thank_you_card.dart';
// import 'package:flutter/material.dart';

// class ThankYouViewBody extends StatelessWidget {
//   const ThankYouViewBody({super.key, required this.bookingDataModel});
//   final BookingDataModel bookingDataModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           ThankYouCard(
//             bookingDataModel: bookingDataModel,
//           ),
//           Positioned(
//             bottom: MediaQuery.sizeOf(context).height * .2 + 20,
//             left: 20 + 8,
//             right: 20 + 8,
//             child: const CustomDashedLine(),
//           ),
//           Positioned(
//               left: -20,
//               bottom: MediaQuery.sizeOf(context).height * .2,
//               child: const CircleAvatar(
//                 backgroundColor: Colors.white,
//               )),
//           Positioned(
//               right: -20,
//               bottom: MediaQuery.sizeOf(context).height * .2,
//               child: const CircleAvatar(
//                 backgroundColor: Colors.white,
//               )),
//           const Positioned(
//             top: -50,
//             left: 0,
//             right: 0,
//             child: CustomCheckIcon(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomCheckIcon extends StatelessWidget {
//   const CustomCheckIcon({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const CircleAvatar(
//       radius: 50,
//       backgroundColor: Color(0xFFD9D9D9),
//       child: CircleAvatar(
//         radius: 40,
//         backgroundColor: Color(0xff34A853),
//         child: Icon(
//           Icons.check,
//           size: 50,
//         ),
//       ),
//     );
//   }
// }

// class CustomDashedLine extends StatelessWidget {
//   const CustomDashedLine({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List.generate(
//         30,
//         (index) => Expanded(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: Container(
//               color: const Color(0xffB8B8B8),
//               height: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
