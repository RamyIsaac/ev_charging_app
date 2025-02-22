import 'package:ev_charging/constants.dart';
import 'package:flutter/material.dart';

class MyBookingViewBody extends StatelessWidget {
  const MyBookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TabBar(
          indicatorColor: kSecondaryColor,
          labelColor: kSecondaryColor,
          dividerHeight: 0.25,
          tabs: [
            Tab(text: 'Ongoing booking'),
            Tab(text: 'Booking history'),
          ],
        ),
        Expanded(
          child: TabBarView(children: [
            Center(
              child: Text('Ongoing booking'),
            ),
            Center(
              child: Text('Booking history'),
            ),
          ]),
        )
      ],
    );
  }
}
