part of 'search_screen_bloc.dart';

class SearchScreenEvent extends Equatable {
  const SearchScreenEvent();

  @override
  List<Object> get props => [];
}

class ShowResultSearch extends SearchScreenEvent {
  const ShowResultSearch({required this.keyword});
  final String keyword;

  @override
  List<Object> get props => [];
}

class LoadMore extends SearchScreenEvent {
  const LoadMore();

  @override
  List<Object> get props => [];
}
