import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';
import '../../helper/network_helper.dart';
import '../../models/film_model.dart';

part 'tvshows_screen_event.dart';
part 'tvshows_screen_state.dart';

class TvshowsScreenBloc extends Bloc<TvshowsScreenEvent, TvshowsScreenState> {
  int page = 1;
  RefreshController refreshController = RefreshController();
  TvshowsScreenBloc() : super(const TvshowsScreenState()) {
    on<InitTvShowsScreen>(_onInitTvShowsScreen);
    on<LoadMoreTvShows>(_onLoadMoreCartoon);
  }

  Future<void> _onInitTvShowsScreen(
      InitTvShowsScreen event, Emitter<TvshowsScreenState> emit) async {
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
          tvShowsList: [],
        ),
      );
      final listTvShows = await HandleResponseApi.handleApiListTVShows(
        page: page,
        limit: 12,
      );
      emit(
        state.copyWith(
          tvShowsList: listTvShows,
        ),
      );
    }
  }

  Future<void> _onLoadMoreCartoon(
      LoadMoreTvShows event, Emitter<TvshowsScreenState> emit) async {
    final listMoreTvShows = await HandleResponseApi.handleApiListTVShows(
      page: ++page,
      limit: 12,
    );
    if (listMoreTvShows.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
      emit(
        state.copyWith(
          tvShowsList: [...state.tvShowsList!, ...listMoreTvShows],
        ),
      );
    }
  }
}
