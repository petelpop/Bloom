import 'package:bloc/bloc.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
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
}
