import 'package:bloom/common/constants.dart';
import 'package:bloom/feature/flora/presentation/views/flora_page.dart';
import 'package:bloom/feature/home/presentation/views/home_page.dart';
import 'package:bloom/feature/loka/presentation/views/loka_page.dart';
import 'package:bloom/feature/main/cubit/main_page_cubit.dart';
import 'package:bloom/feature/main/presentation/methods/navigation_bar.dart';
import 'package:bloom/feature/main/presentation/methods/navigation_bar_item.dart';
import 'package:bloom/feature/pilah/presentation/views/pilah_page.dart';
import 'package:bloom/feature/terra/presentation/views/article_page.dart';
import 'package:bloom/utils/shared_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  static const String routeName = 'main-page';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> listPage(int page) => [
        HomePage(),
        PilahPage(),
        LokaPage(),
        FloraPage(),
        ArticlePage()
      ];

      void setCompleteOnBoarding() async {
          await SharedStorage.setOnboardingComplete(true);
      }

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MainPageCubit>().setPage(0);
    setCompleteOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, MainPageState>(
      builder: (context, state) {
        if (state is SetPage) {
          return Scaffold(
            extendBody: true,
            body: Stack(
              children: [
                IndexedStack(
                  index: state.index,
                  children: listPage(state.index),
                )
              ],
            ),
            bottomNavigationBar: BottomNavBar(
                items: [
                  BottomNavBarItem(
                    index: 0, 
                    isSelected: state.index == 0, 
                    title: "Home", 
                    imageSelected: Constants.icHomeSelected, 
                    imageUnselect: Constants.icHomeUnselect),
                    BottomNavBarItem(
                    index: 1, 
                    isSelected: state.index == 1, 
                    title: "Pilah", 
                    imageSelected: Constants.icPilahSelected, 
                    imageUnselect: Constants.icPilahUnselect),
                    BottomNavBarItem(
                    index: 2, 
                    isSelected: state.index == 2, 
                    title: "Loka", 
                    imageSelected: Constants.icLokaSelected, 
                    imageUnselect: Constants.icLokaUnselect),
                    BottomNavBarItem(
                    index: 3, 
                    isSelected: state.index == 3, 
                    title: "Flora", 
                    imageSelected: Constants.icFloraSelected, 
                    imageUnselect: Constants.icFloraUnselect),
                    BottomNavBarItem(
                    index: 4, 
                    isSelected: state.index == 4, 
                    title: "Terra", 
                    imageSelected: Constants.icTerraSelected, 
                    imageUnselect: Constants.icTerraUnselect),
                ],
                onTap: (int page) =>
                    context.read<MainPageCubit>().setPage(page),
                selectedIndex: state.index)
          );
        }
        return Container();
      },
    );
  }
}
