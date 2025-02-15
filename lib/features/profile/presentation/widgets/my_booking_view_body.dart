import 'package:flutter/material.dart';

class MyBookingViewBody extends StatelessWidget {
  const MyBookingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TabBar(
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
