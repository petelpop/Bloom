import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_button.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/loka/presentation/views/loka_page.dart';
import 'package:bloom/feature/pilah/data/model/pilah.dart';
import 'package:bloom/feature/pilah/presentation/cubit/pilah_cubit.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ResultPage extends StatefulWidget {
  static const String routeName = "result-page";

  PilahModel? pilah;
  ResultPage({super.key, required this.pilah});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String? typeText;
  String? descText;
  Color? typeColor;
  Color? strokeColor;
  Color? containerColor;
  Color? sampahColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.pilah?.label == "Organik") {
      typeText = "Organik";
      descText =
          "Sampah yang berasal dari bahan alami atau makhluk hidup, seperti sisa makanan, daun kering, kulit buah, dan limbah dapur. Sampah organik dapat terurai secara alami (biodegradable) dan biasanya digunakan untuk membuat kompos.";
      typeColor = primaryColor600;
      sampahColor = Color(0xFF008F66).withOpacity(0.5);
      containerColor = primaryColor50;
      strokeColor = primaryColor100;
    } else if (widget.pilah?.label == "Anorganik") {
      typeText = "Anorganik";
      descText =
          "Sampah yang berasal dari bahan non-alami atau sulit terurai, seperti plastik, kaca, logam, kertas, dan kaleng. Sampah ini sering kali dapat didaur ulang menjadi produk baru melalui proses daur ulang.";
      typeColor = moderatColor600;
      sampahColor = Color(0xFFD19F00).withOpacity(0.5);
      containerColor = moderatColor50;
      strokeColor = moderatColor100;
    } else if (widget.pilah?.label == "B3") {
      typeText = "B3";
      descText =
          "Sampah yang mengandung bahan berbahaya atau beracun yang dapat merusak lingkungan dan membahayakan kesehatan manusia, seperti baterai bekas, pestisida, limbah medis, oli, dan bahan kimia lainnya. Sampah ini memerlukan penanganan khusus.";
      typeColor = tidakSehatBColor600;
      sampahColor = Color(0xFFE02141).withOpacity(0.5);
      containerColor = tidakSehatBColor50;
      strokeColor = tidakSehatBColor100;
    } else {
      typeText = "Undefined";
      descText = "Tidak ada";
      typeColor = tidakSehatBColor600;
      sampahColor = Color(0xFFE02141).withOpacity(0.5);
      containerColor = tidakSehatBColor50;
      strokeColor = tidakSehatBColor100;
    }
  }

  @override
  Widget build(BuildContext context) {
    LoggerService.info(
        "this is label ${widget.pilah?.label} ${widget.pilah?.image}");
    return BlocListener<PilahCubit, PilahState>(
      listener: (context, state) {
        if(state is PilahDetected) {
          context.goNamed(ResultPage.routeName, extra: state.pilah);
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFDFDFD),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Constants.icPilahText,
                  width: 70,
                ),
                InkWell(
                    onTap: () => context.pop(),
                    child: Image.asset(
                      Constants.icX,
                      width: 24,
                    )),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              PrimaryText(
                text: "Tipe Sampah Kamu Adalah...",
                fontWeight: 700,
                fontSize: 18,
                lineHeight: 1.2,
                letterSpacing: -0.3,
                color: neutralDefault,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: widget.pilah?.image != null
                                  ? FileImage(widget.pilah!.image!)
                                  : AssetImage(Constants.imgPlaceHolder))),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: containerColor,
                          border: Border.all(color: strokeColor!, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: "Sampah",
                              color: sampahColor,
                              fontWeight: 600,
                              fontSize: 16,
                              letterSpacing: -0.2,
                              lineHeight: 1.4,
                            ),
                            PrimaryText(
                              text: typeText,
                              fontWeight: 900,
                              fontSize: 28,
                              letterSpacing: -0.2,
                              lineHeight: 1.2,
                              color: typeColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              PrimaryText(
                text: "PENJELASAN SINGKAT",
                fontWeight: 700,
                fontSize: 12,
                letterSpacing: -0.1,
                lineHeight: 1.4,
                color: neutralAccent2,
              ),
              SizedBox(height: 8),
              PrimaryText(
                text: descText,
                fontSize: 14,
                letterSpacing: -0.2,
                lineHeight: 1.4,
                color: neutralSecondary,
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: surface200,
                    border: Border.all(color: surface500),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  child: Center(
                    child: PrimaryText(
                      text:
                          "Pastikan kamu membuang sampah pada tempat yang sesuai!",
                      fontSize: 13,
                      lineHeight: 1.4,
                      letterSpacing: -0.1,
                      color: neutralSecondary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                        context.read<PilahCubit>().pickImage(context, ImageSource.camera);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xFFFFFFFF),
                              border: Border.all(color: surface300),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF000000).withOpacity(0.04),
                                    blurRadius: 20)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(Constants.icCamera, width: 20),
                                SizedBox(width: 8),
                                PrimaryText(
                                  text: "Foto Lagi",
                                  lineHeight: 1.4,
                                  letterSpacing: -0.1,
                                  color: neutralDefault,
                                  fontWeight: 700,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                            context.read<PilahCubit>().pickImage(context, ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xFFFFFFFF),
                              border: Border.all(color: surface300),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF000000).withOpacity(0.04),
                                    blurRadius: 20)
                              ]),
                          child: Padding(
                            padding: EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(Constants.icImage, width: 20),
                                SizedBox(width: 8),
                                PrimaryText(
                                  text: "Upload Lagi",
                                  lineHeight: 1.4,
                                  letterSpacing: -0.1,
                                  color: neutralDefault,
                                  fontWeight: 700,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                PrimaryButton(
                  backgroundColor: primaryColor600,
                  textColor: whiteColor,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                  fontWeight: 700,
                  width: double.infinity,
                  text: "Lihat Tempat Sampah Terdekat",
                  function: () {
                    context.goNamed(LokaPage.routeName);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
