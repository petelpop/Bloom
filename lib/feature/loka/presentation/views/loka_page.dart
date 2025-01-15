import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/common/shimmer_card.dart';
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
            zoomOption: ZoomOption(
              initZoom: 15
            )
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 187,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 116),
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
