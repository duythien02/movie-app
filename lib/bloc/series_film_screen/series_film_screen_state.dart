part of 'series_film_screen_bloc.dart';

class SeriesFilmScreenState extends Equatable {
  const SeriesFilmScreenState({
    this.seriesFilmList,
    this.isHasNetwork = true,
  });

  final List<FilmModel>? seriesFilmList;
  final bool isHasNetwork;

  SeriesFilmScreenState copyWith({
    List<FilmModel>? seriesFilmList,
    bool? isHasNetwork,
  }) {
    return SeriesFilmScreenState(
      seriesFilmList: seriesFilmList ?? this.seriesFilmList,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
    );
  }

  @override
  List<Object?> get props => [seriesFilmList, isHasNetwork];
}
