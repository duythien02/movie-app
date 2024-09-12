part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.newestFilmList,
    this.singleFilmList,
    this.seriesFilmList,
    this.cartoonList,
    this.tvShowsList,
    this.isExpandSingleFilm = false,
    this.isExpandSeriesFilm = false,
    this.isExpandCartoon = false,
    this.isExpandTVShows = false,
    this.isSearching = false,
    this.isLoading = false,
  });

  final List<FilmModel>? newestFilmList;
  final List<FilmModel>? singleFilmList;
  final List<FilmModel>? seriesFilmList;
  final List<FilmModel>? cartoonList;
  final List<FilmModel>? tvShowsList;
  final bool isExpandSingleFilm;
  final bool isExpandSeriesFilm;
  final bool isExpandCartoon;
  final bool isExpandTVShows;
  final bool isSearching;
  final bool isLoading;

  HomeScreenState copyWith({
    List<FilmModel>? newestFilmList,
    List<FilmModel>? singleFilmList,
    List<FilmModel>? seriesFilmList,
    List<FilmModel>? cartoonList,
    List<FilmModel>? tvShowsList,
    bool? isExpandSingleFilm,
    bool? isExpandSeriesFilm,
    bool? isExpandCartoon,
    bool? isExpandTVShows,
    bool? isSearching,
    bool? isLoading,
  }) {
    return HomeScreenState(
      newestFilmList: newestFilmList ?? this.newestFilmList,
      singleFilmList: singleFilmList ?? this.singleFilmList,
      seriesFilmList: seriesFilmList ?? this.seriesFilmList,
      cartoonList: cartoonList ?? this.cartoonList,
      tvShowsList: tvShowsList ?? this.tvShowsList,
      isExpandSingleFilm: isExpandSingleFilm ?? this.isExpandSingleFilm,
      isExpandSeriesFilm: isExpandSeriesFilm ?? this.isExpandSeriesFilm,
      isExpandCartoon: isExpandCartoon ?? this.isExpandCartoon,
      isExpandTVShows: isExpandTVShows ?? this.isExpandTVShows,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        newestFilmList,
        singleFilmList,
        seriesFilmList,
        cartoonList,
        tvShowsList,
        isExpandSingleFilm,
        isExpandSeriesFilm,
        isExpandCartoon,
        isExpandTVShows,
        isSearching,
        isLoading,
      ];
}
