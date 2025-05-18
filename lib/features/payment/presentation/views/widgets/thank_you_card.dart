// import 'package:ev_charging/core/models/booking_data_model.dart';
// import 'package:ev_charging/core/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class ThankYouCard extends StatelessWidget {
//   const ThankYouCard({
//     super.key,
//     required this.bookingDataModel,
//   });
//   final BookingDataModel bookingDataModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: ShapeDecoration(
//         color: const Color(0xFFEDEDED),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
//         child: Column(
//           children: [
//             const Text(
//               'Thank you!',
//               textAlign: TextAlign.center,
//               style: Styles.textStyle22,
//             ),
//             const Text(
//               'Your transaction was successful',
//               textAlign: TextAlign.center,
//               style: Styles.textStyle18,
//             ),
//             const SizedBox(
//               height: 42,
//             ),
//             PaymentItemInfo(
//               title: 'Date',
//               value: bookingDataModel.date.toString() ?? '',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             PaymentItemInfo(
//               title: 'Time',
//               value: bookingDataModel.time.toString() ?? '',
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             PaymentItemInfo(
//               title: 'Car Model',
//               value: bookingDataModel.vehicleModel ?? '',
//             ),
//             PaymentItemInfo(
//               title: 'Car Type',
//               value: bookingDataModel.vehicleType ?? '',
//             ),
//             const Divider(
//               height: 60,
//               thickness: 2,
//             ),
//             TotalPrice(
//                 title: 'Total', value: bookingDataModel.price.toString() ?? ''),
//             const SizedBox(
//               height: 30,
//             ),
//             const CardInfoWidget(),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Icon(
//                   Icons.qr_code_2,
//                   size: 64,
//                 ),
//                 Container(
//                   width: 113,
//                   height: 58,
//                   decoration: ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                           width: 1.50, color: Color(0xFF34A853)),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'PAID',
//                       textAlign: TextAlign.center,
//                       style: Styles.textStyle22
//                           .copyWith(color: const Color(0xff34A853)),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentItemInfo extends StatelessWidget {
//   const PaymentItemInfo({super.key, required this.title, required this.value});
//   final String title, value;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           title,
//           textAlign: TextAlign.center,
//           style: Styles.textStyle18,
//         ),
//         Text(
//           value,
//           style: Styles.textStyle18,
//         )
//       ],
//     );
//   }
// }

// class TotalPrice extends StatelessWidget {
//   const TotalPrice({super.key, required this.title, required this.value});

//   final String title, value;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           title,
//           textAlign: TextAlign.center,
//           style: Styles.textStyle22,
//         ),
//         const Spacer(),
//         Text(
//           value,
//           textAlign: TextAlign.center,
//           style: Styles.textStyle22,
//         )
//       ],
//     );
//   }
// }

// class CardInfoWidget extends StatelessWidget {
//   const CardInfoWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 555,
//       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//       ),
//       child: Row(
//         children: [
//           SvgPicture.asset('assets/images/master_card.svg'),
//           const SizedBox(
//             width: 12,
//           ),
//           Text.rich(
//             TextSpan(
//               children: [
//                 const TextSpan(
//                   text: 'Credit Card',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                   ),
//                 ),
//                 TextSpan(
//                   text: '',
//                   style: TextStyle(
//                     color: Colors.black.withOpacity(0.699999988079071),
//                     fontSize: 16,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                     height: 0,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
