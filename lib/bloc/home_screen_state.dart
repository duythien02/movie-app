part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.newestFilmList,
    this.singleFilmList,
    this.seriesFilmList,
    this.cartoonList,
    this.tvShowsList,
    this.isShowMoreSingleFilm = false,
    this.isShowMoreSeriesFilm = false,
    this.isShowMoreCartoon = false,
    this.isShowMoreTVShows = false,
  });

  final List<FilmModel>? newestFilmList;
  final List<FilmModel>? singleFilmList;
  final List<FilmModel>? seriesFilmList;
  final List<FilmModel>? cartoonList;
  final List<FilmModel>? tvShowsList;
  final bool isShowMoreSingleFilm;
  final bool isShowMoreSeriesFilm;
  final bool isShowMoreCartoon;
  final bool isShowMoreTVShows;

  HomeScreenState copyWith({
    List<FilmModel>? newestFilmList,
    List<FilmModel>? singleFilmList,
    List<FilmModel>? seriesFilmList,
    List<FilmModel>? cartoonList,
    List<FilmModel>? tvShowsList,
    bool? isShowMoreSingleFilm,
    bool? isShowMoreSeriesFilm,
    bool? isShowMoreCartoon,
    bool? isShowMoreTVShows,
  }) {
    return HomeScreenState(
      newestFilmList: newestFilmList ?? this.newestFilmList,
      singleFilmList: singleFilmList ?? this.singleFilmList,
      seriesFilmList: seriesFilmList ?? this.seriesFilmList,
      cartoonList: cartoonList ?? this.cartoonList,
      tvShowsList: tvShowsList ?? this.tvShowsList,
      isShowMoreSingleFilm: isShowMoreSingleFilm ?? this.isShowMoreSingleFilm,
      isShowMoreSeriesFilm: isShowMoreSeriesFilm ?? this.isShowMoreSeriesFilm,
      isShowMoreCartoon: isShowMoreCartoon ?? this.isShowMoreCartoon,
      isShowMoreTVShows: isShowMoreTVShows ?? this.isShowMoreTVShows,
    );
  }

  @override
  List<Object?> get props => [
        newestFilmList,
        singleFilmList,
        seriesFilmList,
        cartoonList,
        tvShowsList,
        isShowMoreSingleFilm,
        isShowMoreSeriesFilm,
        isShowMoreCartoon,
        isShowMoreTVShows,
      ];
}
