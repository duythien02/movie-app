import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';
import '../../helper/network_helper.dart';
import '../../models/film_model.dart';

part 'series_film_screen_event.dart';
part 'series_film_screen_state.dart';

class SeriesFilmScreenBloc
    extends Bloc<SeriesFilmScreenEvent, SeriesFilmScreenState> {
  int page = 1;
  RefreshController refreshController = RefreshController();

  SeriesFilmScreenBloc() : super(const SeriesFilmScreenState()) {
    on<InitSeriesFilmScreen>(onInitSeriesFilmScreen);
    on<LoadMoreSeriesFilm>(onLoadMoreSeriesFilm);
  }

  Future<void> onInitSeriesFilmScreen(
      InitSeriesFilmScreen event, Emitter<SeriesFilmScreenState> emit) async {
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
          seriesFilmList: [],
        ),
      );
      final listSeriesFilm = await HandleResponseApi.handleApiListSeries(
        page: page,
        limit: 12,
      );
      emit(
        state.copyWith(
          seriesFilmList: listSeriesFilm,
        ),
      );
    }
  }

  Future<void> onLoadMoreSeriesFilm(
      LoadMoreSeriesFilm event, Emitter<SeriesFilmScreenState> emit) async {
    final listMoreSeriesFilm = await HandleResponseApi.handleApiListSeries(
      page: ++page,
      limit: 12,
    );
    if (listMoreSeriesFilm.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
      emit(
        state.copyWith(
          seriesFilmList: [...state.seriesFilmList!, ...listMoreSeriesFilm],
        ),
      );
    }
  }
}
