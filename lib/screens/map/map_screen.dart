import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

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

  late BitmapDescriptor customIcon;
  final List<Marker> _marker = [];
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
  Uint8List? marketImages;
  List<String> images = ['assets/images/parking-icon.png'];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

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
    loadData();
  }

  loadData() async {
    for (int i = 0; i < parkingLocation.length; i++) {
      final Uint8List markIcons = await getImages(images[0], 100);
      // makers added according to index
      _marker.add(Marker(
        // given marker id
        markerId: MarkerId(i.toString()),
        // given marker icon
        icon: BitmapDescriptor.fromBytes(markIcons),
        // given position
        position: parkingLocation[i],
        infoWindow: InfoWindow(
          // given title for marker
          title: 'Parking: ${i + 1}',
        ),
      ));
      setState(() {});
    }
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
                  markers: Set<Marker>.of(_marker),
                ),
        ));
  }
}
