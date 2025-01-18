part of 'splash_cubit.dart';

sealed class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

final class SplashInitial extends SplashState {}

final class onBoardingComplete extends SplashState {
  final bool isOnBoardingComplete;

  onBoardingComplete({required this.isOnBoardingComplete});

  @override
  // TODO: implement props
  List<Object> get props => [isOnBoardingComplete];
}
