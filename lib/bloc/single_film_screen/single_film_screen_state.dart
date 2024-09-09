part of 'single_film_screen_bloc.dart';

class SingleFilmScreenState extends Equatable {
  const SingleFilmScreenState({
    this.singleFilmList,
    this.isHasNetwork = true,
  });

  final List<FilmModel>? singleFilmList;
  final bool isHasNetwork;

  SingleFilmScreenState copyWith({
    List<FilmModel>? singleFilmList,
    bool? isHasNetwork,
  }) {
    return SingleFilmScreenState(
      singleFilmList: singleFilmList ?? this.singleFilmList,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
    );
  }

  @override
  List<Object?> get props => [singleFilmList, isHasNetwork];
}
