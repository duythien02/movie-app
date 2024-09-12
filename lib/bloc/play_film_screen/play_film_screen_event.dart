part of 'play_film_screen_bloc.dart';

class PlayFilmScreenEvent extends Equatable {
  const PlayFilmScreenEvent();

  @override
  List<Object> get props => [];
}

class InitPlayFilmScreen extends PlayFilmScreenEvent {
  const InitPlayFilmScreen({required this.film});
  final FilmModel film;

  @override
  List<Object> get props => [film];
}

class ExpandContent extends PlayFilmScreenEvent {
  const ExpandContent();

  @override
  List<Object> get props => [];
}
