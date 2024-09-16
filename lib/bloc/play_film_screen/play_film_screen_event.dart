part of 'play_film_screen_bloc.dart';

class PlayFilmScreenEvent extends Equatable {
  const PlayFilmScreenEvent();

  @override
  List<Object> get props => [];
}

class InitPlayFilmScreen extends PlayFilmScreenEvent {
  const InitPlayFilmScreen({required this.filmSlug});
  final String filmSlug;

  @override
  List<Object> get props => [filmSlug];
}

class ChangeEpisode extends PlayFilmScreenEvent {
  const ChangeEpisode({required this.currentEp});
  final int currentEp;

  @override
  List<Object> get props => [currentEp];
}
