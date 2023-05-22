import 'dart:io';

import 'package:ecoparking_mobile/models/place.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = FlutterConfigPlus.get(Platform.isAndroid
      ? 'GOOGLE_MAPS_ANDROID_API_KEY'
      : 'GOOGLE_MAPS_IOS_API_KEY');

  Future<List<Place>>? getPlaces(double lat, double lng) async {
    var url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key');
    var response = await http.get(url);
    print(response.body);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    print(jsonResults);
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}
