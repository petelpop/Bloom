import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

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
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OSMFlutter(
        controller: controller, 
        osmOption: OSMOption(

        )),
    );
  }
}