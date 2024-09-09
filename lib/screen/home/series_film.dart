import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/series_film_screen/series_film_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_film.dart';
import '../../constants/app_constants.dart';

class SeriesFilmScreen extends StatefulWidget {
  const SeriesFilmScreen({super.key});

  @override
  State<SeriesFilmScreen> createState() => _SeriesFilmScreenState();
}

class _SeriesFilmScreenState extends State<SeriesFilmScreen> {
  final _seriesFilmBloc = SeriesFilmScreenBloc();

  @override
  void initState() {
    _seriesFilmBloc.add(const InitSeriesFilmScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _seriesFilmBloc,
      child: BlocBuilder<SeriesFilmScreenBloc, SeriesFilmScreenState>(
        bloc: _seriesFilmBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: const MyAppBar(
              child: SimpleChildAppBar(
                titleAppBar: StringConstants.singleFilm,
              ),
            ),
            body: ListFilm(
              isHasNetwork: state.isHasNetwork,
              listFilm: state.seriesFilmList,
              refresh: () {
                _seriesFilmBloc.add(const InitSeriesFilmScreen());
                _seriesFilmBloc.refreshController.refreshCompleted();
              },
              loadMore: () {
                _seriesFilmBloc.add(const LoadMoreSeriesFilm());
              },
              refreshController: _seriesFilmBloc.refreshController,
            ),
          );
        },
      ),
    );
  }
}
