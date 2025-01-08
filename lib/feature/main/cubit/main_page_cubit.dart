import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageInitial());

  void setPage(int index) {
    emit(SetPage(index: index));
  }
}
