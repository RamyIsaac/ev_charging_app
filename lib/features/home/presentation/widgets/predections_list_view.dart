import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/google_maps_places_service.dart';
import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:ev_charging/features/home/data/models/place_details_model/place_details_model.dart';
import 'package:flutter/material.dart';

class PredectionsListView extends StatelessWidget {
  const PredectionsListView({
    super.key,
    required this.places,
    required this.googleMapsPlacesService,
    required this.onPlaceSelected,
  });

  final List<PlaceAutocompleteModel> places;
  final GoogleMapsPlacesService googleMapsPlacesService;
  final void Function(PlaceDetailsModel) onPlaceSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              var placeDetails = await googleMapsPlacesService.getPlaceDetails(
                placeId: places[index].placeId.toString(),
              );
              onPlaceSelected(placeDetails);
            },
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
