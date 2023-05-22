import 'package:ecoparking_mobile/config/theme.dart';
import 'package:ecoparking_mobile/models/place.dart';
import 'package:ecoparking_mobile/screens/home/home_screen.dart';
import 'package:ecoparking_mobile/services/blocs/geolocator/geolocator_bloc.dart';
import 'package:ecoparking_mobile/services/geolocator/geolocator_servce.dart';
import 'package:ecoparking_mobile/services/places/places.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfigPlus.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locatorService = GeoLocatorService();
  final placesServices = PlacesService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider(
            create: (context) => locatorService.getCurrentLocation(),
            initialData: null),
        ProxyProvider<Position, Future<List<Place>>?>(
          update: (context, position, places) {
            return (position != null)
                ? placesServices.getPlaces(
                    position.latitude, position.longitude)
                : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Demo maps',
        theme: theme(),
        home: const HomeScreen(),
      ),
    );
  }
}
