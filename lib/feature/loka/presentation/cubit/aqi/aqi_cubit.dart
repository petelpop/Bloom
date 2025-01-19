import 'package:bloc/bloc.dart';
import 'package:bloom/feature/loka/data/model/loka_aqi.dart';
import 'package:equatable/equatable.dart';

part 'aqi_state.dart';

class AqiCubit extends Cubit<AqiState> {
  AqiCubit() : super(AqiInitial());

  
}
