import 'package:ecoparking_mobile/services/geolocator/base_geolocator_service.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocatorService extends BaseGeoLocationService {
  GeoLocatorService();

  @override
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
