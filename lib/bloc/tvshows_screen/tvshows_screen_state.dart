part of 'tvshows_screen_bloc.dart';

class TvshowsScreenState extends Equatable {
  const TvshowsScreenState({
    this.tvShowsList,
    this.isHasNetwork = true,
  });

  final List<FilmModel>? tvShowsList;
  final bool isHasNetwork;

  TvshowsScreenState copyWith({
    List<FilmModel>? tvShowsList,
    bool? isHasNetwork,
  }) {
    return TvshowsScreenState(
      tvShowsList: tvShowsList ?? this.tvShowsList,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
    );
  }

  @override
  List<Object?> get props => [tvShowsList, isHasNetwork];
}
