import 'package:carousel_slider/carousel_slider.dart';
import 'package:movye/common/gridview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/common/shimmer.dart';
import 'package:movye/constants/assets.dart';

import '../../../bloc/home_screen/home_screen_bloc.dart';
import '../../../common/appbar.dart';
import '../../../common/network_image.dart';
import '../../../common/search_bar.dart';
import '../../../constants/app_constants.dart';
import '../../../models/film_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final _homeBloc = HomeScreenBloc();

  @override
  bool wantKeepAlive = true;

  @override
  void initState() {
    _homeBloc.add(const InitHomeScreen());
    super.initState();
  }

  //Widget Common
  Widget _title(
    String title,
    int page,
  ) {
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
                  color: const Color(ColorConstants.dark),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  _homeBloc.add(
                    GoToSeeMoreScreen(
                      page: page,
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.sp,
                    vertical: 4.sp,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    border: Border.all(
                      color: const Color(ColorConstants.gray),
                    ),
                  ),
                  child: Text(
                    StringConstants.sliderSeeMore,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(ColorConstants.gray),
                    ),
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
    bool isExpand,
    int page,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 24.sp,
        ),
        _title(title, page),
        SizedBox(
          height: 16.sp,
        ),
        MyGridView.home(
          isExpand: isExpand,
          listFilm: listFilm,
        ),
        SizedBox(
          height: 12.sp,
        ),
        GestureDetector(
          onTap: listFilm != null && listFilm.isNotEmpty
              ? () {
                  _homeBloc.add(
                    ShowMoreFilmList(
                      isExpand: !isExpand,
                      page: page,
                    ),
                  );
                }
              : null,
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
                isExpand ? StringConstants.zoomOut : StringConstants.expand,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => _homeBloc,
      child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: _homeBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8.sp),
                  height: 40.sp,
                  width: 40.sp,
                  child: Image.asset(
                    Assets.assetsAppLogo,
                  ),
                ),
                state.isSearching
                    ? Expanded(
                        child: MySearchBar(
                          onTapOutside: () {
                            _homeBloc.add(
                              ShowSearch(openSearch: !state.isSearching),
                            );
                          },
                          onSubmitted: (value) {
                            _homeBloc.add(
                              SubmitSearch(keyword: value),
                            );
                          },
                          onDelete: _homeBloc.textController.clear,
                          controller: _homeBloc.textController,
                          autoFocus: true,
                        ),
                      )
                    : Text(
                        StringConstants.homeTitle,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(68, 68, 95, 1),
                        ),
                      ),
                if (!state.isSearching)
                  GestureDetector(
                    onTap: () {
                      _homeBloc.add(
                        const ShowSearch(openSearch: true),
                      );
                    },
                    child: SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                      child: Icon(
                        state.isSearching ? Icons.close : Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            )),
            body: SmartRefresher(
              controller: _homeBloc.refreshController,
              onRefresh: () {
                _homeBloc.add(const InitHomeScreen());
                _homeBloc.refreshController.refreshCompleted();
              },
              header: const MaterialClassicHeader(
                color: Color(
                  ColorConstants.primaryOrange,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.sp,
                    ),
                    _title(StringConstants.newestFilm, 0),
                    SizedBox(
                      height: 16.sp,
                    ),
                    // slider
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 283.sp,
                        viewportFraction: 0.3.sp,
                        autoPlay: state.newestFilmList != null &&
                            state.newestFilmList!.isNotEmpty,
                        autoPlayInterval: const Duration(seconds: 5),
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: state.newestFilmList != null &&
                                state.newestFilmList!.isNotEmpty
                            ? null
                            : const NeverScrollableScrollPhysics(),
                      ),
                      items: state.newestFilmList != null &&
                              state.newestFilmList!.isNotEmpty
                          ? state.newestFilmList?.map((film) {
                              return GestureDetector(
                                onTap: () {
                                  _homeBloc.add(
                                    GoToPlayFilmScreen(filmSLug: film.slug),
                                  );
                                },
                                child: Column(
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
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color:
                                              const Color(ColorConstants.dark),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList()
                          : List.generate(
                              3,
                              (index) => Column(
                                children: [
                                  MyShimmer(
                                    height: 212.sp,
                                    width: 143.sp,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 2.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.sp,
                                  ),
                                  MyShimmer(
                                    height: 16.sp,
                                    width: 143.sp,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 2.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),

                    _gridViewFilm(
                      StringConstants.singleFilm,
                      state.singleFilmList,
                      state.isExpandSingleFilm,
                      1,
                    ),

                    _gridViewFilm(
                      StringConstants.series,
                      state.seriesFilmList,
                      state.isExpandSeriesFilm,
                      2,
                    ),

                    _gridViewFilm(
                      StringConstants.cartoon,
                      state.cartoonList,
                      state.isExpandCartoon,
                      3,
                    ),

                    _gridViewFilm(
                      StringConstants.shows,
                      state.tvShowsList,
                      state.isExpandTVShows,
                      4,
                    ),
                    SizedBox(
                      height: 16.sp,
                    ),
                    Center(
                      child: Text(
                        StringConstants.endScreen,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(ColorConstants.gray),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.sp,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
