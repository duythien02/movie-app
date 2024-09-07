import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../screen/favourite.dart';
import '../../screen/home.dart';

part 'main_home_event.dart';
part 'main_home_state.dart';

class MainHomeBloc extends Bloc<MainHomeEvent, MainHomeState> {
  late final TabController screenController;

  List<Widget> listScreen = const [
    HomeScreen(),
    FavouriteScreen(),
  ];

  MainHomeBloc() : super(const MainHomeState()) {
    on<ChangeScreen>(_onChangeScreen);
  }

  void _onChangeScreen(ChangeScreen event, Emitter<MainHomeState> emit) {
    screenController.index = event.index;
    emit(
      state.copyWith(
        index: event.index,
      ),
    );
  }
}
