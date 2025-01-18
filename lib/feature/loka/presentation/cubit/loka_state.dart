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
