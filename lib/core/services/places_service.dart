import 'dart:convert';

import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:ev_charging/features/home/data/models/place_details_model/place_details_model.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyD5f2lyiptJ_9ytm2qcEBo9DzSILAXlKBE';

  Future<List<PlaceAutocompleteModel>> getPlacePredictions(
      {required String input, required String sessionToken}) async {
    var response = await http.get(
      Uri.parse(
          '$baseUrl/autocomplete/json?key=$apiKey&input=$input&sessiontoken=$sessionToken'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<PlaceAutocompleteModel> places = [];
      for (var item in data) {
        places.add(PlaceAutocompleteModel.fromJson(item));
      }
      return places;
    } else {
      throw Exception('Failed to load place predictions');
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    var response = await http
        .get(Uri.parse('$baseUrl/details/json?key=$apiKey&place_id=$placeId'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];

      return PlaceDetailsModel.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
