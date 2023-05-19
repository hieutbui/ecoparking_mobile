import 'package:geolocator/geolocator.dart';

abstract class BaseGeoLocationService {
  Future<Position?> getCurrentLocation() async {}
}
