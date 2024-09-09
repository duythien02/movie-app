import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bloc/single_film_screen/single_film_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_item.dart';
import '../../common/loading.dart';
import '../../common/no_internet.dart';
import '../../common/shimmer.dart';
import '../../constants/app_constants.dart';

class SingleFilmScreen extends StatefulWidget {
  const SingleFilmScreen({super.key});

  @override
  State<SingleFilmScreen> createState() => _SingleFilmScreenState();
}

class _SingleFilmScreenState extends State<SingleFilmScreen> {
  final _singleFilmBloc = SingleFilmScreenBloc();

  @override
  void initState() {
    _singleFilmBloc.add(const InitSingleFilmScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _singleFilmBloc,
      child: BlocBuilder<SingleFilmScreenBloc, SingleFilmScreenState>(
        bloc: _singleFilmBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(
              child: SimpleChildAppBar(
                titleAppBar: StringConstants.singleFilm,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.sp,
              ),
              child: state.isHasNetwork
                  ? SmartRefresher(
                      controller: _singleFilmBloc.refreshController,
                      enablePullUp: true,
                      header: const MaterialClassicHeader(
                        color: Color(ColorConstants.primaryOrange),
                      ),
                      footer: CustomFooter(
                        builder: (context, mode) {
                          Widget body;
                          if (mode == LoadStatus.loading) {
                            body = const Loading();
                          } else if (mode == LoadStatus.noMore) {
                            body = Text(
                              StringConstants.endScreen,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(
                                  ColorConstants.gray,
                                ),
                              ),
                            );
                          } else {
                            body = const Text('');
                          }
                          return SizedBox(
                            height: 55.sp,
                            child: Center(
                              child: body,
                            ),
                          );
                        },
                      ),
                      onRefresh: () {
                        _singleFilmBloc.add(const InitSingleFilmScreen());
                        _singleFilmBloc.refreshController.refreshCompleted();
                      },
                      onLoading: () {
                        _singleFilmBloc.add(const LoadMoreSingleFilm());
                      },
                      child: state.singleFilmList != null &&
                              state.singleFilmList!.isNotEmpty
                          ? SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                  state.singleFilmList!.length,
                                  (index) {
                                    final film = state.singleFilmList![index];
                                    String urlImg =
                                        AppConstants.apiFilmImg + film.thumpUrl;
                                    return Column(
                                      children: [
                                        ListItem(
                                          film: film,
                                          urlImg: urlImg,
                                        ),
                                        SizedBox(
                                          height: 10.sp,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          : const MyShimmerList(),
                    )
                  : NoInternet(
                      tryAgain: () {
                        _singleFilmBloc.add(const InitSingleFilmScreen());
                      },
                    ),
            ),
          );
        },
      ),
    );
  }
}
