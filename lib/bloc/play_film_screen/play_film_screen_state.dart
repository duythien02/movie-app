part of 'play_film_screen_bloc.dart';

class PlayFilmScreenState extends Equatable {
  const PlayFilmScreenState({
    this.isLoading = true,
    this.currentEp = 0,
    this.isExpandedContent = false,
  });
  final bool isLoading;
  final int currentEp;
  final bool isExpandedContent;

  PlayFilmScreenState copyWith({
    bool? isLoading,
    int? currentEp,
    bool? isExpandedContent,
  }) {
    return PlayFilmScreenState(
      isLoading: isLoading ?? this.isLoading,
      currentEp: currentEp ?? this.currentEp,
      isExpandedContent: isExpandedContent ?? this.isExpandedContent,
    );
  }

  @override
  List<Object?> get props => [isLoading, currentEp, isExpandedContent];
}
