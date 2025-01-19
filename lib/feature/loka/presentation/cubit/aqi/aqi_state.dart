part of 'aqi_cubit.dart';

sealed class LokaAqiState extends Equatable {
  const LokaAqiState();

  @override
  List<Object> get props => [];
}

final class AqiInitial extends LokaAqiState {}

final class LokaAqiLoading extends LokaAqiState {}

final class LokaAqiLoadingLocation extends LokaAqiState {}

final class LokaAqiFailedLocation extends LokaAqiState {
  final String? message;

  LokaAqiFailedLocation({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
final class LokaAqiLoadedLocation extends LokaAqiState {
  final String? lat;
  final String? lng;
  final String? lat2;
  final String? lng2;

  LokaAqiLoadedLocation({required this.lat, required this.lng, required this.lat2, required this.lng2});

  @override
  // TODO: implement props
  List<Object> get props => [lat!, lng!, lat2!, lng2!];
}

final class LokaAqiLoaded extends LokaAqiState {
  final List<AqiLokaDataModel>? data;

  LokaAqiLoaded({required this.data});

  @override
  // TODO: implement props
  List<Object> get props => [data!];
}

final class LokaAqiFailed extends LokaAqiState {
  final String? message;

  LokaAqiFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}