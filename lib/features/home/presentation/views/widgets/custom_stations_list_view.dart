import 'package:ev_charging/features/home/presentation/views/widgets/custom_stations_list_view_bloc.dart';
import 'package:flutter/material.dart';

class CustomStationsListView extends StatelessWidget {
  const CustomStationsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20, // Adjust positioning as needed
      left: 0,
      right: 0,

      height: 190, // Give it a fixed height
      child: SizedBox(
        height:
            MediaQuery.of(context).size.height * 0.3, // Ensure a defined height
        child: const CustomStationListViewBloc(),
      ),
    );
  }
}
