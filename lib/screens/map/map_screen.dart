import 'package:flutter/material.dart';
import 'package:flutter_config_plus/flutter_config_plus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _isLoading = false;
  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap mapboxMap) {
    mapboxMap.location.updateSettings(LocationComponentSettings(enabled: true));
    mapboxMap.setCamera(CameraOptions(zoom: 16));
    this.mapboxMap = mapboxMap;
  }

  final parkingLocation = [
    const LatLng(20.9716007, 105.8449143),
    const LatLng(21.0048051, 105.8456057),
    const LatLng(21.0090433, 105.845613),
    const LatLng(20.9996014, 105.8275606),
    const LatLng(21.0023299, 105.8407845),
    const LatLng(21.0185259, 105.7825852),
    const LatLng(21.0050739, 105.8247139),
    const LatLng(20.9876015, 105.7933831),
    const LatLng(20.9869604, 105.8310628),
    const LatLng(20.9947686, 105.8437232),
    const LatLng(20.9926906, 105.8361958),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SafeArea(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MapWidget(
                    resourceOptions: ResourceOptions(
                        accessToken:
                            '${FlutterConfigPlus.get('MAPBOX_PUBLIC_ACCESS_TOKEN')}'),
                    styleUri: '${FlutterConfigPlus.get('MAPSTYLE_URL')}',
                    onMapCreated: _onMapCreated,
                  )));
  }
}
