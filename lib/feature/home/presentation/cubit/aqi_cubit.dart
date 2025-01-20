import 'package:bloc/bloc.dart';
import 'package:bloom/feature/home/data/model/aqi_model.dart';
import 'package:bloom/feature/home/data/services/aqi_services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'aqi_state.dart';

class AqiCubit extends Cubit<AqiState> {
  AqiCubit() : super(AqiInitial());

  final _services = AqiServices();

  void getAqiData(String? lat, String? lng) async {

    if (lat == null || lng == null) {
    emit(AqiFailed(message: "Latitude or Longitude cannot be null"));
    return;
  }

    emit(AqiLoading());
    try {
      final result = await _services.getAqiData(lat, lng);
      result.fold(
        (l) {
          emit(AqiFailed(message: l.message));
        }, 
        (r) {
          emit(AqiLoaded(data: r.data));
        }
        );
    } on DioException catch (e) {
      emit(AqiFailed(message: e.toString()));
    }
  }

  void getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  emit(AqiLoadingLocation());

  try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    emit(AqiLocationFailed(message: 'Location services are disabled.'));
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      emit(AqiLocationFailed(message: 'Location permissions are denied'));
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    emit(AqiLocationFailed(message: 'Location permissions are permanently denied, we cannot request permissions.'));
  } 

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.lowest
  );
  emit(AqiLoadedLocation(lat: position.latitude.toString(), lng: position.longitude.toString()));
  } catch (e) {
  emit(AqiLocationFailed(message: "error: $e")); 
  }
  }
}
