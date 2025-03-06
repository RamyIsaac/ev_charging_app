import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<bool> checkAndRequestLocatonService() async {
    var isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      var isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkAndRequestLocatonPermission() async {
    var permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void getRealTimeData(void Function(LocationData)? onData) {
    location.onLocationChanged.listen(onData);
  }
}
