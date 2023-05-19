import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecoparking_mobile/services/geolocator/geolocator_servce.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocator_event.dart';
part 'geolocator_state.dart';

class GeolocatorBloc extends Bloc<GeolocatorEvent, GeolocatorState> {
  final GeoLocatorService _geoLocatorService;
  StreamSubscription? _geolocatorSubscription;

  GeolocatorBloc({required GeoLocatorService geoLocatorService})
      : _geoLocatorService = geoLocatorService,
        super(GeolocatorLoading()) {
    on<GeolocatorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  @override
  Stream<GeolocatorState> mapEventToState(GeolocatorEvent event) async* {
    if (event is LoadGeoLocator) {
      yield* _mapLoadGeolocatorToState();
    } else if (event is UpdateGeoLocator) {
      yield* _mapUpdateGeolocatorToState(event);
    }
  }

  Stream<GeolocatorState> _mapLoadGeolocatorToState() async* {
    _geolocatorSubscription?.cancel();

    final Position position = await _geoLocatorService.getCurrentLocation();

    add(UpdateGeoLocator(position: position));
  }

  Stream<GeolocatorState> _mapUpdateGeolocatorToState(
      UpdateGeoLocator event) async* {
    yield GeolocatorLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocatorSubscription?.cancel();
    return super.close();
  }
}
