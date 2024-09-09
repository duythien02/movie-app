import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/tvshows/tvshows_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_film.dart';
import '../../constants/app_constants.dart';

class TvshowsScreen extends StatefulWidget {
  const TvshowsScreen({super.key});

  @override
  State<TvshowsScreen> createState() => _TvshowsScreenState();
}

class _TvshowsScreenState extends State<TvshowsScreen> {
  final _tvShowsBloc = TvshowsScreenBloc();

  @override
  void initState() {
    super.initState();
    _tvShowsBloc.add(const InitTvShowsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _tvShowsBloc,
      child: BlocBuilder<TvshowsScreenBloc, TvshowsScreenState>(
        bloc: _tvShowsBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(
              child: SimpleChildAppBar(
                titleAppBar: StringConstants.shows,
              ),
            ),
            body: ListFilm(
              isHasNetwork: state.isHasNetwork,
              listFilm: state.tvShowsList,
              refresh: () {
                _tvShowsBloc.add(const InitTvShowsScreen());
                _tvShowsBloc.refreshController.refreshCompleted();
              },
              loadMore: () {
                _tvShowsBloc.add(const LoadMoreTvShows());
              },
              refreshController: _tvShowsBloc.refreshController,
            ),
          );
        },
      ),
    );
  }
}
