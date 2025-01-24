import 'dart:io';

import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:bloom/feature/pilah/presentation/cubit/pilah_cubit.dart';
import 'package:bloom/feature/pilah/presentation/views/result_page.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:go_router/go_router.dart';
import 'dart:developer' as devtools;

import 'package:image_picker/image_picker.dart';

class PilahPage extends StatefulWidget {
  static const String routeName = "pilah-page";
  const PilahPage({super.key});

  @override
  State<PilahPage> createState() => _PilahPageState();
}

class _PilahPageState extends State<PilahPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PilahCubit>().tfLteInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PilahCubit, PilahState>(
      listener: (context, state) {
        if (state is PilahDetected) {
          LoggerService.info("ini label dari pilah page ${state.pilah.label}");
          context.pushNamed(ResultPage.routeName, extra: state.pilah);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFDFDFD),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Constants.imgTrashBg),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: "Pilah Dulu Yuk!",
                      fontSize: 28,
                      fontWeight: 700,
                      lineHeight: 1.4,
                      letterSpacing: -0.2,
                      color: neutralDefault,
                    ),
                    SizedBox(height: 8),
                    PrimaryText(
                      text:
                          "Langsung jepret atau upload foto sampahmu dari galeri, semua sama gampangnya!",
                      lineHeight: 1.4,
                      fontSize: 16,
                      letterSpacing: -0.1,
                      color: neutralSecondary,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              context.read<PilahCubit>().pickImage(context, ImageSource.camera);
                            },
                            child: ShortcutWidget(
                                icon: Constants.icCamera,
                                text: "Pakai Kamera",
                                desc: "Cekrek! langsung kepilah"),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container()),
                        Expanded(
                          flex: 7,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),
                            onTap: () {
                              context.read<PilahCubit>().pickImage(context, ImageSource.gallery);
                            },
                            child: ShortcutWidget(
                                icon: Constants.icImage,
                                text: "Upload Gambar",
                                desc: "Satset! langsung kepilah"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
