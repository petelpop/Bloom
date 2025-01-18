import 'package:bloc/bloc.dart';
import 'package:bloom/utils/shared_storage.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void onBoardingCheck() async {
    bool onBoardingStatus = await SharedStorage.isOnboardingComplete();
    if (onBoardingStatus == true) {
      emit(onBoardingComplete(isOnBoardingComplete: true));
    } else {
      emit(onBoardingComplete(isOnBoardingComplete: false));
    }
  }
}
