import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/models/film_model.dart';
import 'package:pod_player/pod_player.dart';

import '../../bloc/play_film_screen/play_film_screen_bloc.dart';
import '../../common/loading.dart';
import '../../constants/app_constants.dart';

class PlayFilmScreen extends StatefulWidget {
  const PlayFilmScreen({super.key, required this.film});

  final FilmModel film;

  @override
  State<PlayFilmScreen> createState() => _PlayFilmScreenState();
}

class _PlayFilmScreenState extends State<PlayFilmScreen> {
  final _playFilmBloc = PlayFilmScreenBloc();

  @override
  void initState() {
    super.initState();
    _playFilmBloc.add(InitPlayFilmScreen(film: widget.film));
  }

  @override
  void dispose() {
    _playFilmBloc.videoController.dispose();
    _playFilmBloc.close();
    super.dispose();
  }

  Widget infoFilm({
    required String label,
    List<dynamic>? listInfo,
    String? content,
  }) {
    String text = "";
    if (listInfo != null) {
      text = listInfo
          .map((e) {
            if (e is Category) {
              return e.name;
            } else {
              return e;
            }
          })
          .join(', ')
          .toString();
    } else {
      text = content ?? '';
    }
    return RichText(
      text: TextSpan(
        text: '$label: ',
        style: TextStyle(
          fontSize: 16.sp,
          color: const Color(ColorConstants.dark),
          fontWeight: FontWeight.bold,
        ),
        children: listInfo != null
            ? List.generate(
                listInfo.length,
                (index) {
                  if (index == listInfo.length - 1) {
                    return TextSpan(
                      text: listInfo[index] is Category
                          ? '${listInfo[index].name}.'
                          : '${listInfo[index]}.',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    );
                  }
                  return TextSpan(
                    text: listInfo[index] is Category
                        ? '${listInfo[index].name}, '
                        : '${listInfo[index]}, ',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              )
            : [
                TextSpan(
                  text: text,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _playFilmBloc,
      child: BlocBuilder<PlayFilmScreenBloc, PlayFilmScreenState>(
        bloc: _playFilmBloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: state.isLoading
                  ? const Center(child: Loading())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: PodVideoPlayer(
                            controller: _playFilmBloc.videoController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.sp,
                              ),
                              Text(
                                widget.film.name,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(ColorConstants.dark),
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Text(
                                      '${widget.film.year}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color(ColorConstants.gray),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: const Color(ColorConstants.dark),
                                      thickness: 1.sp,
                                    ),
                                    Text(
                                      '${widget.film.lang}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color(ColorConstants.gray),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: const Color(ColorConstants.dark),
                                      thickness: 1.sp,
                                    ),
                                    Text(
                                      widget.film.country!.first.name,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color(ColorConstants.gray),
                                      ),
                                    ),
                                    VerticalDivider(
                                      color: const Color(ColorConstants.dark),
                                      thickness: 1.sp,
                                    ),
                                    Text(
                                      widget.film.type == 'series'
                                          ? StringConstants.series
                                          : StringConstants.singleFilm,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color(ColorConstants.gray),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              infoFilm(
                                label: StringConstants.typeFilm,
                                listInfo: widget.film.category!,
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              infoFilm(
                                label: StringConstants.timeFilm,
                                content: widget.film.time,
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              infoFilm(
                                label: StringConstants.contentFilm,
                                content: widget.film.content,
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              infoFilm(
                                label: StringConstants.director,
                                listInfo: widget.film.director!,
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              infoFilm(
                                label: StringConstants.actor,
                                listInfo: widget.film.actor!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
