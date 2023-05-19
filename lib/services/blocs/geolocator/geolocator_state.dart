part of 'geolocator_bloc.dart';

abstract class GeolocatorState extends Equatable {
  const GeolocatorState();

  @override
  List<Object> get props => [];
}

class GeolocatorLoading extends GeolocatorState {}

class GeolocatorLoaded extends GeolocatorState {
  final Position position;

  GeolocatorLoaded({required this.position});

  @override
  List<Object> get props => [position];
}

class GeolocatorError extends GeolocatorState {}
