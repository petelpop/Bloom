part of 'main_page_cubit.dart';

sealed class MainPageState extends Equatable {
  const MainPageState();

  @override
  List<Object> get props => [];
}

final class MainPageInitial extends MainPageState {}

final class SetPage extends MainPageState {
  final int index;

  SetPage({required this.index});

  @override
  // TODO: implement props
  List<Object> get props => [index];
}
