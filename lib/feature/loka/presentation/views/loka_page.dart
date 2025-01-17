import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/common/shimmer_card.dart';
import 'package:bloom/feature/loka/presentation/methods/trash_list.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:logger/logger.dart';

class LokaPage extends StatefulWidget {
  static const String routeName = "loka-page";
  LokaPage({super.key});

  @override
  State<LokaPage> createState() => _LokaPageState();
}

class _LokaPageState extends State<LokaPage> {
  MapController controller = MapController.withPosition(
    initPosition: GeoPoint(
      latitude: -6.178619907590153,
      longitude: 106.78924845629295,
    ),
  );

  Future<void> addMarker() async {
    for (GeoPoint location in markerLocations) {
      await controller.addMarker(
        location,
        markerIcon: MarkerIcon(
          iconWidget: Image.asset(
            Constants.icLocationOsm,
            width: 48,
            height: 48,
          ),
        )
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller, 
          osmOption: OSMOption(
            markerOption: MarkerOption(),
            zoomOption: ZoomOption(
              initZoom: 15
            )
          ),
          onMapIsReady: (_) {
            LoggerService.error("on map is ready ? $_");
            if (_) {
            addMarker();              
            }
          },),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.only(top: 560),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          Constants.icTrashGray,
                          width: 20,),
                          SizedBox(width: 6),
                        PrimaryText(
                          text: "Lokasi Terdekat",
                          color: neutralAccent1,
                          fontSize: 12,
                          letterSpacing: -0.2,
                          lineHeight: 1.4,
                          fontWeight: 500,)
                      ],
                    ),

                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PrimaryText(
                          text: "1.210m",
                          lineHeight: 1.4,
                          letterSpacing: -0.2,
                          fontSize: 28,
                          fontWeight: 900,
                          color: neutralDefault,),
                          SizedBox(width: 8,),
                          PrimaryText(
                            text: "Dari Kamu",
                            lineHeight: 1.4,
                            letterSpacing: -0.2,
                            color: neutralTertiary,)
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
                      function: (){

                      },
                      )
                  ],
                ),),
            ),
          )
        ],
      )
    );
  }
}
