part of 'newest_film_screen_bloc.dart';

class NewestFilmScreenState extends Equatable {
  const NewestFilmScreenState({
    this.newestFilmList,
    this.isHasNetwork = true,
  });

  final List<FilmModel>? newestFilmList;
  final bool isHasNetwork;

  NewestFilmScreenState copyWith({
    List<FilmModel>? newestFilmList,
    bool? isHasNetwork,
  }) {
    return NewestFilmScreenState(
      newestFilmList: newestFilmList ?? this.newestFilmList,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
    );
  }

  @override
  List<Object?> get props => [
        newestFilmList,
        isHasNetwork,
      ];
}
