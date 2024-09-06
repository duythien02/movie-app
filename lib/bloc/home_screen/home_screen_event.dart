part of 'home_screen_bloc.dart';

class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class InitHomeScreen extends HomeScreenEvent {
  const InitHomeScreen();

  @override
  List<Object> get props => [];
}

class LoadNewestFilmList extends HomeScreenEvent {
  const LoadNewestFilmList();

  @override
  List<Object> get props => [];
}

class LoadSingleFilmList extends HomeScreenEvent {
  const LoadSingleFilmList();

  @override
  List<Object> get props => [];
}

class LoadSeriesFilmList extends HomeScreenEvent {
  const LoadSeriesFilmList();

  @override
  List<Object> get props => [];
}

class LoadCartoonList extends HomeScreenEvent {
  const LoadCartoonList();

  @override
  List<Object> get props => [];
}

class LoadTVShowList extends HomeScreenEvent {
  const LoadTVShowList();

  @override
  List<Object> get props => [];
}

class ShowMoreFilmList extends HomeScreenEvent {
  const ShowMoreFilmList({
    required this.isExpand,
    required this.page,
  });
  final int page;
  final bool isExpand;

  @override
  List<Object> get props => [isExpand, page];
}

class ShowSearch extends HomeScreenEvent {
  const ShowSearch({required this.isSearching});
  final bool isSearching;

  @override
  List<Object> get props => [isSearching];
}

class SubmitSearch extends HomeScreenEvent {
  const SubmitSearch({required this.keyword});
  final String keyword;

  @override
  List<Object> get props => [keyword];
}
