import 'package:bloom/common/shimmer_card.dart';
import 'package:bloom/feature/loka/presentation/cubit/aqi/aqi_cubit.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<AqiLokaCubit>().getLatLng();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AqiLokaCubit, LokaAqiState>(
        listener: (context, state) {
          LoggerService.info("ini state dari aqi loka page $state");
          if (state is LokaAqiLoadedLocation) {
            context
                .read<AqiLokaCubit>()
                .getAqiMapsData(state.lat, state.lng, state.lat2, state.lng2);
            LoggerService.info(
                "lat lng dari loka aqi loaded ${state.lat}, ${state.lng}");
          }
        },
        builder: (context, state) {
          if (state is LokaAqiLoaded) {
            return OSMFlutter(
                controller: controller,
                onMapIsReady: (isReady) {
                  if (isReady) {
                    controller.changeLocation(
                      GeoPoint(
                        latitude:
                            double.parse((state as LokaAqiLoadedLocation).lat!),
                        longitude:
                            double.parse((state as LokaAqiLoadedLocation).lng!),
                      ),
                    );
                  }
                },
                osmOption: OSMOption(
                    zoomOption: ZoomOption(
                        initZoom: 15, minZoomLevel: 15, maxZoomLevel: 19)));
          } else {
            return ShimmerCard(height: double.infinity);
          }
        },
      ),
    );
  }
}
