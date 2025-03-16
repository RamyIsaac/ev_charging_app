import 'package:ev_charging/features/favourite/presentation/widgets/station_details_view_body.dart';
import 'package:flutter/material.dart';

class StationDetailsView extends StatelessWidget {
  const StationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: StationDetailsViewBody(),
    ));
  }
}
