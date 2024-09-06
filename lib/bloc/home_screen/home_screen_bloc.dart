import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movye/api/api_app.dart';
import 'package:movye/models/film_model.dart';

import '../../route/controllers.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState()) {
    on<InitHomeScreen>(_onInitHomeScreen);
    on<ShowMoreFilmList>(_onShowMoreFilmList);
    on<ShowSearch>(_onSearching);
    on<SubmitSearch>(_onSubmitSearch);
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
    emit(
      state.copyWith(
        isSearching: event.isSearching,
      ),
    );
  }

  void _onSubmitSearch(SubmitSearch event, Emitter<HomeScreenState> emit) {
    if (event.keyword.trim().isNotEmpty) {
      emit(state.copyWith(isSearching: false));
      AppNavigatorControllers.moveToSearchScreen(keyWord: event.keyword);
    }
  }
}
