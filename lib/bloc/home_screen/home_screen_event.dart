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
  const ShowSearch({required this.openSearch});
  final bool openSearch;

  @override
  List<Object> get props => [openSearch];
}

class SubmitSearch extends HomeScreenEvent {
  const SubmitSearch({required this.keyword});
  final String keyword;

  @override
  List<Object> get props => [keyword];
}

class GoToSeeMoreScreen extends HomeScreenEvent {
  const GoToSeeMoreScreen({required this.page});
  final int page;

  @override
  List<Object> get props => [];
}
