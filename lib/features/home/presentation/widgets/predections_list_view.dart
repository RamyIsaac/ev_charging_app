import 'package:ev_charging/constants.dart';
import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:flutter/material.dart';

class PredectionsListView extends StatelessWidget {
  const PredectionsListView({
    super.key,
    required this.places,
  });

  final List<PlaceAutocompleteModel> places;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            iconColor: kSecondaryColor,
            leading: const Icon(Icons.location_pin),
            trailing: const Icon(Icons.arrow_outward_sharp),
            title: Text(places[index].description!),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: places.length,
      ),
    );
  }
}
