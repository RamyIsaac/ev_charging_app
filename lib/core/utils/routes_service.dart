import 'package:ev_charging/features/home/data/models/routes_model/routes_model.dart';

class RoutesService {
  final String baseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';
  final String apiKey = 'AIzaSyD5f2lyiptJ_9ytm2qcEBo9DzSILAXlKBE';
  Future<RoutesModel> fetchRoutes() async {
    Uri url = Uri.parse(baseUrl);
  }
}
