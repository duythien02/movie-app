import 'package:bloc/bloc.dart';
import 'package:chewie/chewie.dart';
import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';
import '../../api/api_app.dart';
import '../../models/film_model.dart';

part 'play_film_screen_event.dart';
part 'play_film_screen_state.dart';

class PlayFilmScreenBloc
    extends Bloc<PlayFilmScreenEvent, PlayFilmScreenState> {
  late VideoPlayerController videoController;
  late ChewieController chewieController;
  PlayFilmScreenBloc() : super(const PlayFilmScreenState()) {
    on<InitPlayFilmScreen>(_onInitPlayFilmScreen);
    on<ChangeEpisode>(_onChangeEpisode);
  }

  Future<void> _onInitPlayFilmScreen(
      InitPlayFilmScreen event, Emitter<PlayFilmScreenState> emit) async {
    final film = await HandleResponseApi.handleApiFilm(slug: event.filmSlug);
    emit(state.copyWith(film: film, isLoading: false));
  }

  Future<void> _onChangeEpisode(
      ChangeEpisode event, Emitter<PlayFilmScreenState> emit) async {
    if (event.currentEp == state.currentEp) return;
    emit(state.copyWith(currentEp: event.currentEp));
    videoController.dispose();
    chewieController.dispose();
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        state.film!.episodes[0].serverData[event.currentEp].linkM3u8,
      ),
    );
    videoController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoController,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      autoPlay: true,
    );
  }
}
