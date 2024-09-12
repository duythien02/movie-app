import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../models/film_model.dart';
import '../screen/home/cartoon.dart';
import '../screen/home/newest_film.dart';
import '../screen/home/series_film.dart';
import '../screen/home/single_film.dart';
import '../screen/home/tvshows.dart';
import '../screen/main_home.dart';
import '../screen/home/search.dart';
import '../screen/play_film/play_film.dart';
import 'route_animation.dart';

class AppNavigatorRoutes {
  static Route? requestRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScreenName.mainHomeScreen:
        return SwipeRight(
          page: const MainHomeScreen(),
        );
      case ScreenName.searchScreen:
        return SwipeRight(
          page: SearchScreen(
            keyWord: routeSettings.arguments as String,
          ),
        );
      case ScreenName.newestFilmScreen:
        return SwipeRight(
          page: const NewestFilmScreen(),
        );
      case ScreenName.singleFilmScreen:
        return SwipeRight(
          page: const SingleFilmScreen(),
        );
      case ScreenName.seriesFilmScreen:
        return SwipeRight(
          page: const SeriesFilmScreen(),
        );
      case ScreenName.cartoonScreen:
        return SwipeRight(
          page: const CartoonScreen(),
        );
      case ScreenName.tvshowsScreen:
        return SwipeRight(
          page: const TvshowsScreen(),
        );
      case ScreenName.playFilmScreen:
        return SwipeRight(
          page: PlayFilmScreen(
            film: routeSettings.arguments as FilmModel,
          ),
        );
    }
    return null;
  }
}
