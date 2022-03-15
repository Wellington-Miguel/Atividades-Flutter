import 'package:geolocator/geolocator.dart';

class Geolocation {
  bool _permission(LocationPermission permission) {
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  Future<bool> checkPermission() async {
    final permission = await Geolocator.checkPermission();
    return _permission(permission);
  }

  Future<bool> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    return _permission(permission);
  }
}
