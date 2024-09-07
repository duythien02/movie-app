part of 'main_home_bloc.dart';

class MainHomeState extends Equatable {
  const MainHomeState({this.index = 0});

  final int index;

  MainHomeState copyWith({
    int? index,
  }) {
    return MainHomeState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [index];
}
