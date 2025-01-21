import 'package:bloom/common/colors.dart';
import 'package:bloom/common/constants.dart';
import 'package:bloom/common/primary_text.dart';
import 'package:bloom/feature/home/presentation/methods/info_widget.dart';
import 'package:bloom/feature/main/cubit/main_page_cubit.dart';
import 'package:bloom/utils/modal_bottom.dart';
import 'package:bloom/utils/shimmer_card.dart';
import 'package:bloom/feature/loka/presentation/views/loka_page.dart';
import 'package:bloom/feature/pilah/presentation/views/pilah_page.dart';
import 'package:bloom/feature/terra/data/article_dummy.dart';
import 'package:bloom/feature/terra/presentation/methods/article_item.dart';
import 'package:bloom/feature/flora/presentation/views/flora_page.dart';
import 'package:bloom/feature/home/presentation/cubit/aqi_cubit.dart';
import 'package:bloom/feature/home/presentation/methods/shortcut_widget.dart';
import 'package:bloom/feature/home/presentation/methods/status_failed_widget.dart';
import 'package:bloom/feature/home/presentation/methods/status_widget.dart';
import 'package:bloom/utils/logger_service.dart';
import 'package:bloom/utils/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "home-page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? position;

  List<Map<String, dynamic>> infoData = [
    {"text": "Baik", "color": primaryColor600, "aqi": "0-50"},
    {"text": "Moderat", "color": moderatColor500, "aqi": "51-100"},
    {
      "text": "Tidak Sehat Bagi Sensitif",
      "color": tidakSehatColor600,
      "aqi": "101-150"
    },
    {"text": "Tidak Sehat", "color": tidakSehatBColor600, "aqi": "151-200"},
    {"text": "Berbahaya", "color": tidakSehatBColor800, "aqi": "201-300"},
    {"text": "Beracun", "color": beracunColor950, "aqi": "301-500"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AqiCubit>().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<AqiCubit>().getLocation();
        },
        color: primaryColor600,
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
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
                  const SizedBox(height: 2),
                  PrimaryText(
                    text: "Sudahkah kamu memulai langkah kecil hari ini?",
                    color: neutralTertiary,
                    lineHeight: 1.4,
                    letterSpacing: -0.1,
                  ),
                  const SizedBox(height: 22),
                  BlocConsumer<AqiCubit, AqiState>(
                    listener: (context, state) {
                    if (state is AqiLoadedLocation) {
                      context.read<AqiCubit>().getAqiData(state.lat, state.lng);
                    }
                    if (state is AqiLocationFailed || state is AqiFailed) {
                      ToastWidget.showToast(context, 
                      message: "terjadi kesalahan, silahkan coba lagi!",
                      position: ToastPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                      color: Colors.red
                      );
                    }
                  }, builder: (context, state) {
                    LoggerService.error("ini state sekarang $state");
                    if (state is AqiLoading) {
                      return const ShimmerCard(
                        height: 180,
                        width: double.infinity,
                        radius: 16,
                      );
                    }
                    if (state is AqiLoaded) {
                      LoggerService.info(
                          "ini city dari aqi ${state.data?.city?.name}");
                      return InkWell(
                        onTap: () {
                          ModalBottom.show(context,
                              view: Container(
                                height: 75.h,
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 14),
                                      Container(
                                        width: 56,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(110),
                                          color: neutralLight,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PrimaryText(
                                            text: "AQI Itu Apa Sih?",
                                            fontWeight: 700,
                                            fontSize: 18,
                                            lineHeight: 1.4,
                                            letterSpacing: -0.1,
                                            color: neutralDefault,
                                          ),
                                          SizedBox(height: 4),
                                          PrimaryText(
                                            text:
                                                "Indeks kualitas udara memudahkan kita memahami udara yang kita hirup. Cukup ingat warnanya!",
                                            fontSize: 14,
                                            lineHeight: 1.4,
                                            letterSpacing: -0.1,
                                            color: neutralTertiary,
                                          ),
                                          SizedBox(height: 20),
                                          Column(
                                            children: infoData.map(
                                              (data) {
                                                return InfoWidget(
                                                    text: data["text"],
                                                    aqi: data["aqi"],
                                                    color: data["color"]);
                                              },
                                            ).toList(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                        child: StatusWidget(
                          city: state.data?.city?.name?.split(" ")[0],
                          aqi: state.data?.aqi.toString(),
                        ),
                      );
                    }
                    if (state is AqiFailed) {
                      return InkWell(
                          onTap: () {
                            context.read<AqiCubit>().getLocation();
                          },
                          child: StatusFailedWidget());
                    }
                    return const ShimmerCard(
                      height: 180,
                      width: double.infinity,
                      radius: 16,
                    );
                  }),
                  const SizedBox(height: 22),
                  PrimaryText(
                    text: "SHORTCUT",
                    fontWeight: 700,
                    fontSize: 12,
                    color: neutralAccent2,
                    letterSpacing: -0.1,
                    lineHeight: 1.4,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: InkWell(
                          onTap: () {
                            context.read<MainPageCubit>().setPage(1);
                          },
                          child: ShortcutWidget(
                              icon: Constants.icBox,
                              text: "Pilah Sampah",
                              desc: "Sebelum dibuang, pilah dulu!"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container()),
                      Expanded(
                        flex: 7,
                        child: InkWell(
                          onTap: () {
                            context.read<MainPageCubit>().setPage(3);
                          },
                          child: ShortcutWidget(
                              icon: Constants.icChatDots,
                              text: "Tanya Flora",
                              desc: "Chatbot AI yang peduli bumi."),
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                            context.read<MainPageCubit>().setPage(2);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 14, bottom: 24),
                      constraints:
                          const BoxConstraints(minHeight: 69, maxHeight: 71),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: whiteColor,
                        border: Border.all(color: surface300, width: 1),
                        boxShadow: [
                          BoxShadow(
                              color: blackColor.withOpacity(0.04),
                              blurRadius: 20),
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
                            const SizedBox(width: 12),
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
                                  text:
                                      "Klik dan temukan tempat sampah terdekat!",
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
                  const SizedBox(height: 16),
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
