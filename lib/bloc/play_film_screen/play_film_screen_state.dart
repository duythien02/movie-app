part of 'play_film_screen_bloc.dart';

class PlayFilmScreenState extends Equatable {
  const PlayFilmScreenState({
    this.isLoading = true,
    this.currentEp = 0,
    this.isExpandedContent = false,
    this.film,
  });
  final bool isLoading;
  final int currentEp;
  final bool isExpandedContent;
  final FilmModel? film;

  PlayFilmScreenState copyWith({
    bool? isLoading,
    int? currentEp,
    bool? isExpandedContent,
    FilmModel? film,
  }) {
    return PlayFilmScreenState(
      isLoading: isLoading ?? this.isLoading,
      currentEp: currentEp ?? this.currentEp,
      isExpandedContent: isExpandedContent ?? this.isExpandedContent,
      film: film ?? this.film,
    );
  }

  @override
  List<Object?> get props => [isLoading, currentEp, isExpandedContent, film];
}
