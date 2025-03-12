import 'package:ev_charging/constants.dart';
import 'package:ev_charging/core/utils/google_maps_places_service.dart';
import 'package:ev_charging/features/home/data/models/place_autocomplete_model/place_autocomplete_model.dart';
import 'package:ev_charging/features/home/presentation/widgets/custom_google_map.dart';
import 'package:ev_charging/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:ev_charging/features/home/presentation/widgets/predections_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late TextEditingController textEditingController;
  late GoogleMapsPlacesService googleMapsPlacesService;
  List<PlaceAutocompleteModel> places = [];
  @override
  void initState() {
    textEditingController = TextEditingController();
    googleMapsPlacesService = GoogleMapsPlacesService();
    fetchPredections();
    super.initState();
  }

  void fetchPredections() {
    textEditingController.addListener(() async {
      if (textEditingController.text.isNotEmpty) {
        var result = await googleMapsPlacesService.getPlacePredictions(
            input: textEditingController.text);

        places.clear();
        places.addAll(result);
        setState(() {});
      } else {
        places.clear();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomGoogleMap(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/Designer (1).jpeg',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ramy Isaac',
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'find your nearest charging point ',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: kSecondaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          CustomSearchBar(
                            textEditingController: textEditingController,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          PredectionsListView(places: places),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.filter_list_rounded),
                        color: kSecondaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
