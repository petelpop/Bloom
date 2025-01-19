import 'package:bloc/bloc.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'loka_state.dart';

class LokaCubit extends Cubit<LokaState> {
  LokaCubit() : super(LokaInitial());

  GeoPoint? selectedGeo;

  void selectedLoka(GeoPoint selected) async {
    emit(LokaSelected(selected: selected));
    selectedGeo = selected;
    LoggerService.info("selected loka $selected");
  }

  Future<void> openMap(double latitude, double longitude) async {
    final String googleMapsUri =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    try {
        await launchUrlString(
          googleMapsUri,
          mode: LaunchMode.externalApplication
          );
    } catch (e) {
      LoggerService.log('Failed to open map: $e');
      rethrow;
    }
  }

  void getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  emit(LokaLoading());

  try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    emit(LokaFailed(message: 'Location services are disabled.'));
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      emit(LokaFailed(message: 'Location permissions are denied'));
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    emit(LokaFailed(message: 'Location permissions are permanently denied, we cannot request permissions.'));
  } 

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high
  );
  emit(LokaLoaded(lat: position.latitude.toString(), lng: position.longitude.toString()));
  } catch (e) {
  emit(LokaFailed(message: "error: $e")); 
  }
  }
}
