import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';
import '../../helper/network_helper.dart';
import '../../models/film_model.dart';

part 'single_film_screen_event.dart';
part 'single_film_screen_state.dart';

class SingleFilmScreenBloc
    extends Bloc<SingleFilmScreenEvent, SingleFilmScreenState> {
  int page = 1;
  RefreshController refreshController = RefreshController();

  SingleFilmScreenBloc() : super(const SingleFilmScreenState()) {
    on<InitSingleFilmScreen>(_onInitSingleFilmScreen);
    on<LoadMoreSingleFilm>(_onLoadMoreSingleFilm);
  }

  Future<void> _onInitSingleFilmScreen(
      InitSingleFilmScreen event, Emitter<SingleFilmScreenState> emit) async {
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
          singleFilmList: [],
        ),
      );
      final listSingleFilm = await HandleResponseApi.handleApiListSingleFilm(
        page: page,
        limit: 12,
      );
      emit(
        state.copyWith(
          singleFilmList: listSingleFilm,
        ),
      );
    }
  }

  Future<void> _onLoadMoreSingleFilm(
      LoadMoreSingleFilm event, Emitter<SingleFilmScreenState> emit) async {
    final listMoreSingleFilm = await HandleResponseApi.handleApiListSingleFilm(
      page: ++page,
      limit: 12,
    );
    if (listMoreSingleFilm.isEmpty) {
      refreshController.loadNoData();
    } else {
      refreshController.loadComplete();
      emit(
        state.copyWith(
          singleFilmList: [...state.singleFilmList!, ...listMoreSingleFilm],
        ),
      );
    }
  }
}
