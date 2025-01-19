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
  final String? realLat;
  final String? realLng;

  LokaAqiLoadedLocation({required this.lat, required this.lng, required this.lat2, required this.lng2, required this.realLat, required this.realLng});

  @override
  // TODO: implement props
  List<Object> get props => [lat!, lng!, lat2!, lng2!, realLat!, realLng!];
}

final class LokaAqiLoaded extends LokaAqiState {
  final List<AqiLokaDataModel>? data;
  final String? lat;
  final String? lng;

  LokaAqiLoaded({required this.data, required this.lat, required this.lng});


  @override
  // TODO: implement props
  List<Object> get props => [data!, lat!, lng!];
}

final class LokaAqiFailed extends LokaAqiState {
  final String? message;

  LokaAqiFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}