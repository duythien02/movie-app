import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pod_player/pod_player.dart';

import '../../models/film_model.dart';

part 'play_film_screen_event.dart';
part 'play_film_screen_state.dart';

class PlayFilmScreenBloc
    extends Bloc<PlayFilmScreenEvent, PlayFilmScreenState> {
  late PodPlayerController videoController;
  PlayFilmScreenBloc() : super(const PlayFilmScreenState()) {
    on<InitPlayFilmScreen>(_onInitPlayFilmScreen);
    on<ExpandContent>(_onExpandContent);
  }

  Future<void> _onInitPlayFilmScreen(
      InitPlayFilmScreen event, Emitter<PlayFilmScreenState> emit) async {
    videoController = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        event.film.episodes.first.serverData.first.linkM3u8,
      ),
    )..initialise();
    emit(state.copyWith(isLoading: false));
  }

  void _onExpandContent(
      ExpandContent event, Emitter<PlayFilmScreenState> emit) {
    emit(state.copyWith(isExpandedContent: !state.isExpandedContent));
  }
}
