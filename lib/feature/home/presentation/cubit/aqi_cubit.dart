import 'package:bloc/bloc.dart';
import 'package:bloom/feature/home/data/model/aqi_model.dart';
import 'package:bloom/feature/home/data/services/aqi_services.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

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
}
