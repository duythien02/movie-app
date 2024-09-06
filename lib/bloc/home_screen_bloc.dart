import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movye/api/api_app.dart';
import 'package:movye/models/film_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<InitHomeScreen>(_onInitHomeScreen);
    on<ShowMoreFilmList>(_onShowMoreFilmList);
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
            isShowMoreSingleFilm: event.isShowMore,
          ),
        );
      case 2:
        emit(
          state.copyWith(
            isShowMoreSeriesFilm: event.isShowMore,
          ),
        );
      case 3:
        emit(
          state.copyWith(
            isShowMoreCartoon: event.isShowMore,
          ),
        );
      default:
        emit(
          state.copyWith(
            isShowMoreTVShows: event.isShowMore,
          ),
        );
    }
  }
}
