part of 'aqi_cubit.dart';

sealed class AqiState extends Equatable {
  const AqiState();

  @override
  List<Object> get props => [];
}

final class AqiInitial extends AqiState {}

final class LokaAqiLoading extends AqiState {}

final class LokaAqiLoadedLocation extends AqiState {
  final String? lat;
  final String? lng;
  final String? lat2;
  final String? lng2;

  LokaAqiLoadedLocation({required this.lat, required this.lng, required this.lat2, required this.lng2});

  @override
  // TODO: implement props
  List<Object> get props => [lat!, lng!, lat2!, lng2!];
}

final class LokaAqiLoaded extends AqiState {
  final AqiLoka? data;

  LokaAqiLoaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

final class LokaAqiFailed extends AqiState {
  final String? message;

  LokaAqiFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}