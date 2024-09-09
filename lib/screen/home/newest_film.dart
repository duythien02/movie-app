import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/common/gridview.dart';
import 'package:movye/common/no_internet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../bloc/newest_film_screen/newest_film_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/loading.dart';
import '../../constants/app_constants.dart';

class NewestFilmScreen extends StatefulWidget {
  const NewestFilmScreen({super.key});

  @override
  State<NewestFilmScreen> createState() => _NewestFilmScreenState();
}

class _NewestFilmScreenState extends State<NewestFilmScreen> {
  final _newestFilmBloc = NewestFilmScreenBloc();

  @override
  void initState() {
    super.initState();
    _newestFilmBloc.add(const InitNewestFilmScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _newestFilmBloc,
      child: BlocBuilder<NewestFilmScreenBloc, NewestFilmScreenState>(
        bloc: _newestFilmBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(
              child: SimpleChildAppBar(
                titleAppBar: StringConstants.newestFilm,
              ),
            ),
            body: state.isHasNetwork
                ? SmartRefresher(
                    controller: _newestFilmBloc.refreshController,
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
                      _newestFilmBloc.add(const InitNewestFilmScreen());
                      _newestFilmBloc.refreshController.refreshCompleted();
                    },
                    onLoading: () {
                      _newestFilmBloc.add(const LoadMoreNewestFilm());
                    },
                    child: MyGridView.other(
                      listFilm: state.newestFilmList,
                    ),
                  )
                : NoInternet(
                    tryAgain: () {
                      _newestFilmBloc.add(const InitNewestFilmScreen());
                    },
                  ),
          );
        },
      ),
    );
  }
}
