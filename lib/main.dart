import 'package:ecoparking_mobile/config/app_router.dart';
import 'package:ecoparking_mobile/config/theme.dart';
import 'package:ecoparking_mobile/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfigPlus.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo maps',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
