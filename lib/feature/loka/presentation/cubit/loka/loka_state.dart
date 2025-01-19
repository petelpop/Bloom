part of 'loka_cubit.dart';

sealed class LokaState extends Equatable {
  const LokaState();

  @override
  List<Object> get props => [];
}

final class LokaInitial extends LokaState {}

final class LokaSelected extends LokaState {
  final GeoPoint selected;

  LokaSelected({required this.selected});

  @override
  // TODO: implement props
  List<Object> get props => [selected];
}

final class LokaLoading extends LokaState {}

final class LokaFailed extends LokaState {
  final String? message;

  LokaFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}

final class LokaLoaded extends LokaState {
  final String? lat;
  final String? lng;

  LokaLoaded({required this.lat, required this.lng});

  @override
  // TODO: implement props
  List<Object> get props => [lat!, lng!];
}
