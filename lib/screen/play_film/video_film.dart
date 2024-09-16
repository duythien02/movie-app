import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movye/bloc/play_film_screen/play_film_screen_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoFilm extends StatefulWidget {
  const VideoFilm({
    super.key,
    required this.urlVideo,
    required this.bloc,
  });
  final String urlVideo;
  final PlayFilmScreenBloc bloc;

  @override
  State<VideoFilm> createState() => _VideoFilmState();
}

class _VideoFilmState extends State<VideoFilm> {
  @override
  void initState() {
    widget.bloc.videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.urlVideo,
      ),
    );
    widget.bloc.videoController.initialize();
    widget.bloc.chewieController = ChewieController(
      videoPlayerController: widget.bloc.videoController,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      autoPlay: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.bloc.videoController.dispose();
    widget.bloc.chewieController.dispose();
    widget.bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget.bloc,
      child: BlocBuilder<PlayFilmScreenBloc, PlayFilmScreenState>(
        bloc: widget.bloc,
        builder: (context, state) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(
              controller: widget.bloc.chewieController,
            ),
          );
        },
      ),
    );
  }
}
