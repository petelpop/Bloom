import 'package:bloom/common/colors.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/loka/presentation/cubit/loka/loka_cubit.dart';
import 'package:bloom/utils/shimmer_card.dart';
import 'package:bloom/feature/home/presentation/cubit/aqi_cubit.dart';
import 'package:bloom/feature/home/presentation/methods/status_failed_widget.dart';
import 'package:bloom/feature/home/presentation/methods/status_widget.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:bloom/feature/loka/presentation/cubit/aqi/aqi_cubit.dart';
import 'package:bloom/feature/loka/presentation/methods/aqi_loka_widget.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:bloom/utils/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

class AqiLokaPage extends StatefulWidget {
  static const String routeName = "aqi-loka-page";
  const AqiLokaPage({super.key});

  @override
  State<AqiLokaPage> createState() => _AqiLokaPageState();
}

class _AqiLokaPageState extends State<AqiLokaPage> {
  MapController controller = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: -6.178619907590153,
      longitude: 106.78924845629295,
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<AqiLokaCubit>().getLatLng();
    context.read<LokaCubit>().getLocation();
    // });
  }

  void addMarkerLocation(List<AqiLokaDataModel>? data) async {
    if (data == null) return;

    // List<Future<void>> markerFutures = [];

    LoggerService.info("item length ${data.length}");
    for (var item in data) {
      // final item = item;
      Color? colorAqi;
      dynamic aqiParse = item.aqi != "-" ? double.parse(item.aqi!) : "-";
        if (aqiParse <= 50) {
        colorAqi = primaryColor600;
      } else if (aqiParse <= 100) {
        colorAqi = moderatColor500;
      } else if (aqiParse <= 150) {
        colorAqi = tidakSehatColor600;
      } else if (aqiParse <= 200) {
        colorAqi = tidakSehatBColor600;
      } else if (aqiParse <= 300) {
        colorAqi = tidakSehatBColor800;
      } else if (aqiParse <= 1000) {
        colorAqi = beracunColor950;
      } else {
        colorAqi = neutralAccent1;
      }

      LoggerService.log("info data ${item.aqi}");
      // markerFutures.add(
      await controller.addMarker(
        GeoPoint(latitude: item.lat!, longitude: item.lon!),
        markerIcon: MarkerIcon(
          iconWidget: Container(
            width: 48,
            height: 48,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: colorAqi),
            child: Center(
              child: PrimaryText(
                text: item.aqi,
                color: whiteColor,
                fontWeight: 900,
                fontSize: 10.67,
                letterSpacing: -0.13,
              ),
            ),
          ),
        ),
        // )
      );
    }
    // await Future.wait(markerFutures);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: "Loka Oksi",
          color: neutralDefault,
          fontSize: 16,
          fontWeight: 500,
        ),
      ),
      body: BlocConsumer<AqiLokaCubit, LokaAqiState>(
        listener: (context, state) {
          LoggerService.info("ini state dari aqi loka page $state");
          if (state is LokaAqiLoadedLocation) {
            context.read<AqiCubit>().getAqiData(state.realLat, state.realLng);
            context.read<AqiLokaCubit>().getAqiMapsData(state.lat, state.lng,
                state.lat2, state.lng2, state.realLat, state.realLng);
            LoggerService.info(
                "lat lng dari loka aqi loaded ${state.lat}, ${state.lng}");
          }
          if (state is LokaAqiFailed || state is LokaAqiFailedLocation) {
            ToastWidget.showToast(context,
                message: "terjadi kesalahan, silahkan coba lagi!",
                position: ToastPosition.BOTTOM,
                duration: Duration(seconds: 2),
                color: Colors.red);
          }
        },
        builder: (context, state) {
          if (state is LokaAqiLoaded) {
            return Stack(
              children: [
                OSMFlutter(
                    controller: controller,
                    onMapIsReady: (isReady) async {
                      if (isReady) {
                        await controller.changeLocation(
                          GeoPoint(
                            latitude: double.parse(state.lat!),
                            longitude: double.parse(state.lng!),
                          ),
                        );

                        addMarkerLocation(state.data);
                      }
                    },
                    osmOption: OSMOption(
                        userLocationMarker: UserLocationMaker(
                            personMarker: MarkerIcon(
                              icon: Icon(
                                Icons.location_history,
                                size: 48,
                                color: primaryColor600,
                              ),
                            ),
                            directionArrowMarker:
                                MarkerIcon(icon: Icon(Icons.location_history))),
                        zoomOption: ZoomOption(
                            initZoom: 10, minZoomLevel: 10, maxZoomLevel: 19))),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                      margin: EdgeInsets.only(top: 60.h),
                      child: BlocBuilder<AqiCubit, AqiState>(
                        builder: (context, stateAqi) {
                          if (stateAqi is AqiLoading) {
                            return const ShimmerCard(
                              height: 180,
                              width: double.infinity,
                              radius: 16,
                            );
                          }
                          if (stateAqi is AqiLoaded) {
                            LoggerService.info(
                                "ini city dari aqi ${stateAqi.data?.city?.name}");
                            return StatusWidget(
                              city: "Daerah Kamu",
                              aqi: stateAqi.data?.aqi.toString(),
                            );
                          }
                          if (stateAqi is AqiFailed) {
                            return InkWell(
                                onTap: () {
                                  context.read<AqiLokaCubit>().getLatLng();
                                },
                                child: StatusFailedWidget());
                          }
                          return const ShimmerCard(
                            height: 180,
                            width: double.infinity,
                            radius: 16,
                          );
                        },
                      )),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
