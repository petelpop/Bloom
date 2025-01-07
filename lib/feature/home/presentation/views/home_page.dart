import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/article/data/article_dummy.dart';
import 'package:bloom/feature/article/presentation/methods/article_item.dart';
import 'package:bloom/feature/home/presentation/cubit/aqi_cubit.dart';
import 'package:bloom/feature/home/presentation/methods/aqi_widget.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:bloom/utils/get_location.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    context.read<AqiCubit>().getAqiData(
        position?.latitude.toString(), position?.longitude.toString());
  }

  void getLocation() async {
    position = await determinePosition();
    LoggerService.info("ini position ${position?.latitude}");
    // ignore: use_build_context_synchronously
    context.read<AqiCubit>().getAqiData(position?.latitude.toString(), position?.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                    text: "Hi Teman Alam!",
                    color: neutralDefault,
                    letterSpacing: -0.2,
                    lineHeight: 1.4,
                    fontWeight: 700,
                    fontSize: 18),
                SizedBox(height: 2),
                PrimaryText(
                  text: "Sudahkah kamu memulai langkah kecil hari ini?",
                  color: neutralTertiary,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                ),
                SizedBox(height: 22),
                BlocProvider(
                  create: (context) => AqiCubit(),
                  child: Container(
                    height: 180,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 115),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFFF0FEF8),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: primaryColor100, width: 1)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 16, left: 16, top: 25),
                              child: Row(children: [
                                Image.asset(Constants.icHeart, width: 16),
                                SizedBox(width: 10),
                                PrimaryText(
                                  text:
                                      "Udaranya lagi bagus nih, olahraga yuk!",
                                  color: primaryColor600,
                                  letterSpacing: -0.1,
                                  lineHeight: 1.4,
                                  fontSize: 14,
                                  fontWeight: 600,
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              color: surface300,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: neutralTertiary,
                                          size: 16,
                                        ),
                                        PrimaryText(
                                          text: "Jakarta",
                                          letterSpacing: -0.1,
                                          lineHeight: 1.4,
                                          color: neutralTertiary,
                                          fontWeight: 500,
                                        )
                                      ],
                                    ),
                                    PrimaryText(
                                      text: "Baik",
                                      fontSize: 28,
                                      color: neutralDefault,
                                      letterSpacing: -0.1,
                                      lineHeight: 1.4,
                                      fontWeight: 900,
                                    )
                                  ],
                                ),
                                AqiWidget()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22),
                PrimaryText(
                  text: "SHORTCUT",
                  fontWeight: 700,
                  fontSize: 12,
                  color: neutralAccent2,
                  letterSpacing: -0.1,
                  lineHeight: 1.4,
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShortcutWidget(
                        icon: Constants.icBox,
                        text: "Pilah Sampah",
                        desc: "Sebelum dibuang, pilah dulu!"),
                    ShortcutWidget(
                        icon: Constants.icChatDots,
                        text: "Tanya Flora",
                        desc: "Chatbot AI yang peduli bumi.")
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 14, bottom: 24),
                  constraints: BoxConstraints(minHeight: 69, maxHeight: 71),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: whiteColor,
                    border: Border.all(color: surface300, width: 1),
                    boxShadow: [
                      BoxShadow(
                          color: blackColor.withOpacity(0.04), blurRadius: 20),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: surface200),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Image.asset(Constants.icTrash),
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              text: "Males Cari Tempat Sampah ?",
                              fontWeight: 700,
                              lineHeight: 1.4,
                              letterSpacing: -0.1,
                              color: neutralDefault,
                            ),
                            PrimaryText(
                              text: "Klik dan temukan tempat sampah terdekat!",
                              fontSize: 12,
                              letterSpacing: -0.1,
                              lineHeight: 1.4,
                              color: neutralTertiary,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                PrimaryText(
                  text: "Artikel Terra",
                  fontWeight: 700,
                  fontSize: 14,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                  color: neutralDefault,
                ),
                PrimaryText(
                  text: "Baca, dan jadi #SiPalingPaham cara menjaga bumi!",
                  fontSize: 12,
                  lineHeight: 1.4,
                  letterSpacing: -0.1,
                  color: neutralTertiary,
                ),
                SizedBox(height: 16),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: articleDummyTitle.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 240,
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return ArticleItem(
                          title: articleDummyTitle[index],
                          desc: articleDummyDesc[index],
                          img: articleDummyImage[index]);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
