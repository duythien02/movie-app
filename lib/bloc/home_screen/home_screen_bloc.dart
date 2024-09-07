import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movye/api/api_app.dart';
import 'package:movye/models/film_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../route/controllers.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final TextEditingController textController = TextEditingController();

  HomeScreenBloc() : super(const HomeScreenState()) {
    on<InitHomeScreen>(_onInitHomeScreen);
    on<ShowMoreFilmList>(_onShowMoreFilmList);
    on<ShowSearch>(_onSearching);
    on<SubmitSearch>(_onSubmitSearch);
    on<ReLoadHomeScreen>(_onLoadHomeScreen);
  }

  Future<void> _onInitHomeScreen(
      InitHomeScreen event, Emitter<HomeScreenState> emit) async {
    final listNewestFilm = await HandleResponseApi.handleApiListNewestFilm(
      page: 1,
    );
    emit(
      state.copyWith(
        newestFilmList: listNewestFilm,
      ),
    );

    final listSingleFilm = await HandleResponseApi.handleApiListSingleFilm(
      page: 1,
      limit: 12,
    );
    emit(
      state.copyWith(
        singleFilmList: listSingleFilm,
      ),
    );

    final listSeriesFilm = await HandleResponseApi.handleApiListSeries(
      page: 1,
      limit: 12,
    );
    emit(
      state.copyWith(
        seriesFilmList: listSeriesFilm,
      ),
    );

    final listCartoon = await HandleResponseApi.handleApiListCartoon(
      page: 1,
      limit: 12,
    );
    emit(
      state.copyWith(
        cartoonList: listCartoon,
      ),
    );

    final listTVShows = await HandleResponseApi.handleApiListTVShows(
      page: 1,
      limit: 12,
    );
    emit(
      state.copyWith(
        tvShowsList: listTVShows,
      ),
    );
  }

  void _onShowMoreFilmList(
      ShowMoreFilmList event, Emitter<HomeScreenState> emit) {
    switch (event.page) {
      case 1:
        emit(
          state.copyWith(
            isExpandSingleFilm: event.isExpand,
          ),
        );
      case 2:
        emit(
          state.copyWith(
            isExpandSeriesFilm: event.isExpand,
          ),
        );
      case 3:
        emit(
          state.copyWith(
            isExpandCartoon: event.isExpand,
          ),
        );
      default:
        emit(
          state.copyWith(
            isExpandTVShows: event.isExpand,
          ),
        );
    }
  }

  void _onSearching(ShowSearch event, Emitter<HomeScreenState> emit) {
    textController.clear();
    emit(
      state.copyWith(
        isSearching: event.openSearch,
      ),
    );
  }

  Future<void> _onSubmitSearch(
      SubmitSearch event, Emitter<HomeScreenState> emit) async {
    if (event.keyword.trim().isNotEmpty) {
      await AppNavigatorControllers.moveToSearchScreen(keyWord: event.keyword)
          ?.whenComplete(() => emit(state.copyWith(isSearching: false)));
    } else {
      textController.clear();
      emit(state.copyWith(isSearching: false));
    }
  }

  Future<void> _onLoadHomeScreen(
      ReLoadHomeScreen event, Emitter<HomeScreenState> emit) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    add(const InitHomeScreen());
    refreshController.refreshCompleted();
  }
}
