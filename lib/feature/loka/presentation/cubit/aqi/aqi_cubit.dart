import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:bloom/feature/loka/data/services/services.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'aqi_state.dart';

class AqiLokaCubit extends Cubit<LokaAqiState> {
  AqiLokaCubit() : super(AqiInitial());

  final _services = LokaServices();

  void getAqiMapsData(
      String? lat, String? lng, String? lat2, String? lng2, String? realLat, String? realLng) async {
    if (lat == null || lng == null || lat2 == null || lng2 == null) {
      emit(LokaAqiFailed(message: "Latitude or Longitude cannot be null"));
      return;
    }

    emit(LokaAqiLoading());
    try {
      final result = await _services.getAqiLocationData(lat, lng, lat2, lng2);
      result.fold((l) {
        emit(LokaAqiFailed(message: l.message));
      }, (r) {
        emit(LokaAqiLoaded(data: r.data, lat: realLat, lng: realLng));
      });
    } on DioException catch (e) {
      emit(LokaAqiFailed(message: e.toString()));
    }
  }

  void getLatLng() async {
    bool serviceEnabled;
    LocationPermission permission;

    emit(LokaAqiLoadingLocation());

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(LokaAqiFailedLocation(message: 'Location services are disabled.'));
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(LokaAqiFailedLocation(message: 'Location permissions are denied'));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(LokaAqiFailedLocation(
            message:
                'Location permissions are permanently denied, we cannot request permissions.'));
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.lowest);
      double latitude = position.latitude;
      double longitude = position.longitude;

      double distance = 100;
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
          lng2: northEastLng.toString(),
          realLat: latitude.toString(),
          realLng: longitude.toString()));
      String latLngBounds =
          "$southWestLat,$southWestLng,$northEastLat,$northEastLng";
      LoggerService.info("bounding box: $latLngBounds");
    } catch (e) {
      emit(LokaAqiFailedLocation(message: "message: $e"));
    }
  }
}
