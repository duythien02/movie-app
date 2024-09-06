import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/home_screen_bloc.dart';
import '../common/appbar.dart';
import '../common/network_image.dart';
import '../constants/app_constants.dart';
import '../models/film_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeBloc = HomeScreenBloc();

  @override
  void initState() {
    homeBloc.add(const InitHomeScreen());
    super.initState();
  }

  //Widget Common
  Widget _title(String title) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.sp,
                  vertical: 4.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  border: Border.all(
                    color: const Color(0xFFE5E4EA),
                  ),
                ),
                child: Text(
                  StringConstants.sliderSeeMore,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFAAA9B1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _gridViewFilm(
    String title,
    List<FilmModel>? listFilm,
    bool isShowMore,
    int page,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 24.sp,
        ),
        _title(title),
        SizedBox(
          height: 16.sp,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 4.sp,
            mainAxisSpacing: 4.sp,
            childAspectRatio: 0.4.sp,
            children: listFilm != null
                ? List.generate(
                    isShowMore ? listFilm.length : 6,
                    (index) {
                      final film = listFilm[index];
                      String urlImg = AppConstants.apiFilmImg + film.posterUrl;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 212.sp,
                            child: MyNetworkImage(
                              url: urlImg,
                              radius: BorderRadius.circular(5.sp),
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.sp,
                            ),
                            child: Text(
                              film.name,
                              style: const TextStyle(fontSize: 16.0),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                //shimmer
                : List.generate(
                    6,
                    (index) {
                      return Column(
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                              height: 212.sp,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade200,
                            child: Container(
                              width: 143.sp,
                              height: 16.sp,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5.sp),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ),
        SizedBox(
          height: 12.sp,
        ),
        GestureDetector(
          onTap: () {
            homeBloc.add(ShowMoreFilmList(isShowMore: !isShowMore, page: page));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.sp),
            height: 32.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
              border: Border.all(
                color: const Color(0xFFE5E4EA),
              ),
            ),
            child: Center(
              child: Text(
                isShowMore ? StringConstants.zoomOut : StringConstants.expand,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: homeBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              children: Center(
                child: Text(
                  StringConstants.homeTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 16.sp,
                  ),
                  _title(StringConstants.newestFilm),
                  SizedBox(
                    height: 16.sp,
                  ),
                  // slider
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 283.sp,
                      viewportFraction: 0.3.sp,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      scrollDirection: Axis.horizontal,
                    ),
                    items: state.newestFilmList?.map((film) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 2.sp,
                                ),
                                width: 143.sp,
                                height: 212.sp,
                                child: MyNetworkImage(
                                  url: film.posterUrl,
                                  radius: BorderRadius.circular(5.sp),
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.sp,
                                ),
                                child: Text(
                                  film.name,
                                  style: const TextStyle(fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          );
                        }).toList() ??
                        List.generate(
                          10,
                          (index) => Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade200,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 2.sp,
                                  ),
                                  width: 143.sp,
                                  height: 212.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.sp,
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey.shade300,
                                highlightColor: Colors.grey.shade200,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 2.sp,
                                  ),
                                  width: 143.sp,
                                  height: 16.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(5.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),

                  _gridViewFilm(
                    StringConstants.singleFilm,
                    state.singleFilmList,
                    state.isShowMoreSingleFilm,
                    1,
                  ),

                  _gridViewFilm(
                    StringConstants.series,
                    state.seriesFilmList,
                    state.isShowMoreSeriesFilm,
                    2,
                  ),

                  _gridViewFilm(
                    StringConstants.cartoon,
                    state.cartoonList,
                    state.isShowMoreCartoon,
                    3,
                  ),

                  _gridViewFilm(
                    StringConstants.shows,
                    state.tvShowsList,
                    state.isShowMoreTVShows,
                    4,
                  ),
                  SizedBox(
                    height: 24.sp,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
