import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<void> checkAndRequestLocatonService() async {
    var isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      var isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationSerViceException();
      }
    }
  }

  Future<void> checkAndRequestLocatonPermission() async {
    var permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  void getRealTimeData(void Function(LocationData)? onData) async {
    await checkAndRequestLocatonService();
    await checkAndRequestLocatonPermission();
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getLocation() async {
    await checkAndRequestLocatonService();
    await checkAndRequestLocatonPermission();
    return await location.getLocation();
  }
}

class LocationSerViceException implements Exception {}

class LocationPermissionException implements Exception {}
