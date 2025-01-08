import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloom/feature/pilah/data/model/pilah.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'dart:developer' as devtools;

part 'pilah_state.dart';

class PilahCubit extends Cubit<PilahState> {
  PilahCubit() : super(PilahInitial());

  String label = '';
  String imagePath = '';
    Future<void> predictImage(String imagePath, File filePath) async {
    var recognitions = await Tflite.runModelOnImage(
      path: imagePath,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.2,
      asynch: true,
    );

    if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
    devtools.log(recognitions.toString());
    emit(PilahDetected(
      pilah: PilahModel(
        label: recognitions[0]['label'].toString(),
        image: filePath
      )
    ));
  }

    Future<void> tfLteInit() async {
    try {
      String? res = await Tflite.loadModel(
          model: "assets/model/model.tflite",
          labels: "assets/model/labels.txt",
          numThreads: 1,
          isAsset: true,
          useGpuDelegate: false);
      devtools.log("Model loaded: $res");
    } catch (e) {
      devtools.log("Error loading model: $e");
    }
  }
}
