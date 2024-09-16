import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../bloc/play_film_screen/play_film_screen_bloc.dart';
import '../../common/loading.dart';
import '../../constants/app_constants.dart';
import 'video_film.dart';

class PlayFilmScreen extends StatefulWidget {
  const PlayFilmScreen({super.key, required this.filmSlug});

  final String filmSlug;

  @override
  State<PlayFilmScreen> createState() => _PlayFilmScreenState();
}

class _PlayFilmScreenState extends State<PlayFilmScreen> {
  final _playFilmBloc = PlayFilmScreenBloc();

  @override
  void initState() {
    super.initState();
    _playFilmBloc.add(InitPlayFilmScreen(filmSlug: widget.filmSlug));
  }

  @override
  void dispose() {
    _playFilmBloc.close();
    super.dispose();
  }

  Widget tagFilm({
    required String tag,
  }) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      decoration: BoxDecoration(
        color: const Color(ColorConstants.lightOrange),
        borderRadius: BorderRadius.circular(4.sp),
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 15.sp,
          color: const Color(ColorConstants.gray),
        ),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VideoFilm(
                          bloc: _playFilmBloc,
                          urlVideo: state.film?.episodes[0]
                                  .serverData[state.currentEp].linkM3u8 ??
                              '',
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.sp,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 16.sp,
                                      ),
                                      Text(
                                        state.film?.name ?? '',
                                        style: TextStyle(
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              const Color(ColorConstants.dark),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      Wrap(
                                        spacing: 8.sp,
                                        runSpacing: 8.sp,
                                        children: [
                                          tagFilm(
                                            tag: state.film?.year.toString() ??
                                                '',
                                          ),
                                          tagFilm(
                                            tag: state.film?.lang ?? '',
                                          ),
                                          tagFilm(
                                            tag: state.film?.country!.first
                                                    .name ??
                                                '',
                                          ),
                                          tagFilm(
                                            tag: state.film?.type == 'series'
                                                ? StringConstants.series
                                                : StringConstants.singleFilm,
                                          ),
                                          tagFilm(
                                              tag: state.film?.quality ?? '')
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      ReadMoreText(
                                        state.film?.content ?? '',
                                        trimMode: TrimMode.Line,
                                        trimLines: 2,
                                        trimCollapsedText:
                                            StringConstants.sliderSeeMore,
                                        trimExpandedText:
                                            StringConstants.zoomOut,
                                        moreStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        lessStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: const Color(
                                            ColorConstants.dark,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.sp,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Thể loại: ',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(
                                                ColorConstants.dark),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          children: List.generate(
                                            state.film?.category!.length ?? 0,
                                            (index) {
                                              if (index ==
                                                  state.film!.category!.length -
                                                      1) {
                                                return TextSpan(
                                                  text:
                                                      '${state.film!.category![index].name}.',
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                );
                                              }
                                              return TextSpan(
                                                text:
                                                    '${state.film!.category![index].name}, ',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      SizedBox(width: 16.sp),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                          state.film!.actor!.length,
                                          (index) {
                                            return IntrinsicHeight(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        const Color(
                                                      ColorConstants
                                                          .lightOrange,
                                                    ),
                                                    radius: 28.sp,
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 35.sp,
                                                    ),
                                                  ),
                                                  SizedBox(width: 8.sp),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 74.sp,
                                                        child: Text(
                                                          state.film!
                                                              .actor![index],
                                                          style: TextStyle(
                                                            fontSize: 13.sp,
                                                            color: const Color(
                                                              ColorConstants
                                                                  .dark,
                                                            ),
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      Text(
                                                        StringConstants.actor,
                                                        style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: const Color(
                                                            ColorConstants.dark,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 4.sp),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 16.sp),
                                    ],
                                  ),
                                ),
                                if (state.film!.episodes[0].serverData.length >
                                    1) ...[
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.sp),
                                    child: Text(
                                      StringConstants.listEpi,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: const Color(
                                          ColorConstants.dark,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                        Row(
                                          children: List.generate(
                                            state.film!.episodes[0].serverData
                                                .length,
                                            (index) {
                                              final episode = state
                                                  .film!
                                                  .episodes[0]
                                                  .serverData[index];
                                              return GestureDetector(
                                                onTap: () {
                                                  _playFilmBloc.add(
                                                      ChangeEpisode(
                                                          currentEp: index));
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(4.sp),
                                                  width: 64.sp,
                                                  height: 44.sp,
                                                  margin: EdgeInsets.only(
                                                    right: index !=
                                                            state
                                                                    .film!
                                                                    .episodes[0]
                                                                    .serverData
                                                                    .length -
                                                                1
                                                        ? 8.sp
                                                        : 0.sp,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8.sp,
                                                    ),
                                                    color: const Color(
                                                      ColorConstants
                                                          .lightOrange,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    episode.name,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: state.currentEp ==
                                                              index
                                                          ? const Color(
                                                              ColorConstants
                                                                  .primaryOrange,
                                                            )
                                                          : const Color(
                                                              ColorConstants
                                                                  .dark,
                                                            ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.sp,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                                SizedBox(
                                  height: 24.sp,
                                ),
                              ],
                            ),
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
