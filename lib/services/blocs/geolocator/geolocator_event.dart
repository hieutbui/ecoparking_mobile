part of 'geolocator_bloc.dart';

abstract class GeolocatorEvent extends Equatable {
  const GeolocatorEvent();

  @override
  List<Object> get props => [];
}

class LoadGeoLocator extends GeolocatorEvent {}

class UpdateGeoLocator extends GeolocatorEvent {
  final Position position;

  UpdateGeoLocator({required this.position});

  @override
  List<Object> get props => [position];
}
