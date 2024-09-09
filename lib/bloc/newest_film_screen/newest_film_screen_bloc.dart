import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movye/models/film_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';
import '../../helper/network_helper.dart';

part 'newest_film_screen_event.dart';
part 'newest_film_screen_state.dart';

class NewestFilmScreenBloc
    extends Bloc<NewestFilmScreenEvent, NewestFilmScreenState> {
  int page = 1;
  final RefreshController refreshController = RefreshController();

  NewestFilmScreenBloc() : super(const NewestFilmScreenState()) {
    on<InitNewestFilmScreen>(_onInitNewestFilmScreen);
    on<LoadMoreNewestFilm>(_onLoadMoreNewestFilm);
  }

  Future<void> _onInitNewestFilmScreen(
      InitNewestFilmScreen event, Emitter<NewestFilmScreenState> emit) async {
    emit(state.copyWith(isHasNetwork: true));
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    final bool hasNetwork = await NetworkHelper.checkNetwork();
    if (!hasNetwork) {
      emit(
        state.copyWith(
          isHasNetwork: false,
        ),
      );
    } else {
      //reset page
      page = 1;
      emit(
        state.copyWith(
          isHasNetwork: true,
          newestFilmList: [],
        ),
      );
      final listNewestFilm = await HandleResponseApi.handleApiListNewestFilm(
        page: page,
      );
      emit(
        state.copyWith(
          newestFilmList: listNewestFilm,
        ),
      );
    }
  }

  Future<void> _onLoadMoreNewestFilm(
      LoadMoreNewestFilm event, Emitter<NewestFilmScreenState> emit) async {
    final listMoreNewestFilm = await HandleResponseApi.handleApiListNewestFilm(
      page: ++page,
    );
    if (listMoreNewestFilm.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
      emit(
        state.copyWith(
          newestFilmList: [...state.newestFilmList!, ...listMoreNewestFilm],
        ),
      );
    }
  }
}
