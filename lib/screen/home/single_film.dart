import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/single_film_screen/single_film_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_film.dart';
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
            body: ListFilm(
              isHasNetwork: state.isHasNetwork,
              listFilm: state.singleFilmList,
              refresh: () {
                _singleFilmBloc.add(const InitSingleFilmScreen());
                _singleFilmBloc.refreshController.refreshCompleted();
              },
              loadMore: () {
                _singleFilmBloc.add(const LoadMoreSingleFilm());
              },
              refreshController: _singleFilmBloc.refreshController,
            ),
          );
        },
      ),
    );
  }
}
