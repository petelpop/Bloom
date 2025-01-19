import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:bloom/feature/loka/data/services/services.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'aqi_state.dart';

class AqiCubit extends Cubit<AqiState> {
  AqiCubit() : super(AqiInitial());

  final _services = LokaServices();

  Future<void> getLatLng() async {
    try {
       bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
      emit(LokaAqiFailedLocation(message: 'Location services are disabled.'));
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      emit(LokaAqiFailedLocation(message: 'Location permissions are denied.'));
    }
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  double latitude = position.latitude;
  double longitude = position.longitude;

  double distance = 1.0; 
  double latOffset = distance / 110.574; 
  double lngOffset = distance / (111.320 * cos(latitude * (pi / 180)));

  double southWestLat = latitude - latOffset;
  double southWestLng = longitude - lngOffset;
  double northEastLat = latitude + latOffset;
  double northEastLng = longitude + lngOffset;

  emit(LokaAqiLoadedLocation(
    lat: southWestLat.toString(), 
    lng: southWestLng.toString(), 
    lat2: northEastLat.toString(), 
    lng2: northEastLng.toString()));
  String latLngBounds =
      "$southWestLat,$southWestLng,$northEastLat,$northEastLng";
    LoggerService.info("bounding box: $latLngBounds");
    } catch (e) {
      emit(LokaAqiFailedLocation(message: "message: $e"));
    }
}
}
