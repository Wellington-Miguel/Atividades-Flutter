import 'package:geolocator/geolocator.dart';

bool _permission(permission) {
  return permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always;
}

class Geolocation {
  Future<bool> checkPermission() {
    return Geolocator.checkPermission()
        .then((permission) => _permission(permission));
  }

  Future<bool> requestPermission() {
    return Geolocator.checkPermission()
        .then((permission) => _permission(permission));
  }
}
