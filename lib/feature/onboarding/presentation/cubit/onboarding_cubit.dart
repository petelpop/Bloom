import 'package:bloc/bloc.dart';
import 'package:bloom/utils/logger_service.dart';

class OnboardingState {
  final bool isLastPage;

  OnboardingState({this.isLastPage = false});
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState());

  void nextPage(int totalPages) {
      LoggerService.info("index dari nextPage ${totalPages}");
    if (totalPages == 2) {
      emit(OnboardingState(isLastPage: true));
    } else {
      emit(OnboardingState());
    }
  }
}

