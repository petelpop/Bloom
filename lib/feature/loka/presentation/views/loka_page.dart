import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/common/shimmer_card.dart';
import 'package:bloom/feature/loka/presentation/cubit/loka/loka_cubit.dart';
import 'package:bloom/feature/loka/presentation/methods/calculate_distance.dart';
import 'package:bloom/feature/loka/presentation/methods/trash_list.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:logger/logger.dart';

class LokaPage extends StatefulWidget {
  static const String routeName = "loka-page";
  LokaPage({super.key});

  @override
  State<LokaPage> createState() => _LokaPageState();
}

class _LokaPageState extends State<LokaPage> {
  double? nearestDistance;
  GeoPoint? nearestLocation;

  MapController controller = MapController.withPosition(
     initPosition:  GeoPoint(
        latitude: 0,
         longitude: 0)
    );

  void addMarker() async {
    for (var location in markerLocations) {
      await controller.addMarker(
        location,
        markerIcon: MarkerIcon(
          iconWidget: RepaintBoundary(
            child: Image.asset(
              Constants.icLocationOsm,
              width: 48,
              height: 48,
            ),
          ),
        ),
      );
    }
    calculateNearestDistance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LokaCubit>().getLocation();
  }

  void calculateNearestDistance() {
    final thisPosition = controller.initPosition;

    for (var location in markerLocations) {
      double distance = calculateDistance(thisPosition!.latitude,
          thisPosition.longitude, location.latitude, location.longitude);

      if (nearestDistance == null || distance < nearestDistance!) {
        setState(() {
          nearestDistance = distance;
          nearestLocation = location;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<LokaCubit, LokaState>(
          listener: (context, state) {
        if (state is LokaLoaded) {
        LoggerService.info("ini state dari loka $state");
        LoggerService.info("state lat ${state.lat}, state lng ${state.lng}");
        controller.changeLocation(
          GeoPoint(
            latitude: double.parse(state.lat!),
            longitude: double.parse(state.lng!),
          ),
        );
      }
    }, builder: (context, state) {
      if (state is LokaLoaded) {
              return Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
                markerOption: MarkerOption(),
                zoomOption: ZoomOption(initZoom: 18)),
            onMapIsReady: (_) {
              if (_) {
                addMarker();
                LoggerService.error("on map is ready ? $_");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.only(top: 560),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Constants.icTrashGray,
                          width: 20,
                        ),
                        SizedBox(width: 6),
                        PrimaryText(
                          text: "Lokasi Terdekat",
                          color: neutralAccent1,
                          fontSize: 12,
                          letterSpacing: -0.2,
                          lineHeight: 1.4,
                          fontWeight: 500,
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryText(
                          text: nearestDistance != null
                              ? "${nearestDistance!.toStringAsFixed(2)}m"
                              : "...",
                          lineHeight: 1.4,
                          letterSpacing: -0.2,
                          fontSize: 28,
                          fontWeight: 900,
                          color: neutralDefault,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        PrimaryText(
                          text: "Dari Kamu",
                          lineHeight: 1.4,
                          letterSpacing: -0.2,
                          color: neutralTertiary,
                        )
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        color: surface300,
                        height: 1,
                      ),
                    ),
                    PrimaryButton(
                      width: double.infinity,
                      text: "Lihat di GMaps",
                      height: 40,
                      // function: () {},
                      function: () async {
                        if (nearestLocation?.latitude != null) {
                          await context.read<LokaCubit>().openMap(
                              nearestLocation!.latitude,
                              nearestLocation!.longitude);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
      } else {
        return ShimmerCard(height: double.infinity);
      }
    }));
  }
}
