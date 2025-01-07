part of 'aqi_cubit.dart';

sealed class AqiState extends Equatable {
  const AqiState();

  @override
  List<Object> get props => [];
}

final class AqiInitial extends AqiState {}

final class AqiLoading extends AqiState {}

final class AqiLoaded extends AqiState {
  final AqiDataModel? data;

  AqiLoaded({required this.data});

  @override
  List<Object> get props => [data!];
}

final class AqiFailed extends AqiState {
  final String message;

  AqiFailed({required this.message});

  @override
  List<Object> get props => [message];
}