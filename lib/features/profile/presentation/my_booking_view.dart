import 'package:ev_charging/features/profile/presentation/widgets/my_booking_view_body.dart';
import 'package:flutter/material.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Booking'),
        ),
        body: const MyBookingViewBody(),
      ),
    );
  }
}
