part of 'pilah_cubit.dart';

sealed class PilahState extends Equatable {
  const PilahState();

  @override
  List<Object> get props => [];
}

final class PilahInitial extends PilahState {}

final class PilahDetected extends PilahState {
  final PilahModel pilah;

  PilahDetected({required this.pilah});

  @override
  // TODO: implement props
  List<Object> get props => [pilah];
}
