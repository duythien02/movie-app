part of 'main_home_bloc.dart';

class MainHomeEvent extends Equatable {
  const MainHomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeScreen extends MainHomeEvent {
  final int index;
  const ChangeScreen({required this.index});

  @override
  List<Object> get props => [];
}
