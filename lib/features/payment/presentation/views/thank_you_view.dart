// import 'package:ev_charging/core/models/booking_data_model.dart';
// import 'package:ev_charging/core/utils/styles.dart';
// import 'package:ev_charging/features/payment/presentation/views/widgets/thank_you_view_body.dart';
// import 'package:flutter/material.dart';

// class ThankYouView extends StatelessWidget {
//   const ThankYouView({super.key, required this.bookingDataModel});
//   final BookingDataModel bookingDataModel;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: buildAppBar(context: context),
//       body: Transform.translate(
//           offset: const Offset(0, -16),
//           child: ThankYouViewBody(
//             bookingDataModel: bookingDataModel,
//           )),
//     );
//   }
// }

// AppBar buildAppBar({final String? title, required BuildContext context}) {
//   return AppBar(
//     leading: Center(
//         child: IconButton(
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       icon: const Icon(Icons.arrow_back_ios),
//       color: Colors.black,
//     )),
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     centerTitle: true,
//     title: Text(
//       title ?? '',
//       textAlign: TextAlign.center,
//       style: Styles.textStyle22,
//     ),
//   );
// }
