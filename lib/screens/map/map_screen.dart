import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late String _mapStyleAndroid;
  late String _mapStyleIOS;

  late LatLng _currentPosition;
  bool _isLoading = true;

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyleAndroid = string;
    });
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyleIOS = string;
    });
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
      _isLoading = false;
    });
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
              : GoogleMap(
                  mapType: MapType.normal,
                  zoomGesturesEnabled: true,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                    Platform.isAndroid
                        ? mapController.setMapStyle(_mapStyleAndroid)
                        : mapController.setMapStyle(_mapStyleIOS);
                  },
                  initialCameraPosition:
                      CameraPosition(target: _currentPosition, zoom: 16.0),
                  markers: {
                    Marker(
                        markerId: MarkerId("source"),
                        position: _currentPosition),
                  },
                ),
        ));
  }
}
