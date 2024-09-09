part of 'search_screen_bloc.dart';

class SearchScreenState extends Equatable {
  const SearchScreenState({
    this.searchFullListFilm,
    this.searchListFilm,
    this.isLoading = true,
    this.isCanLoadMore = false,
    this.isHasNetwork = true,
    this.keyword = '',
  });

  final List<FilmModel>? searchFullListFilm;
  final List<FilmModel>? searchListFilm;
  final bool isLoading;
  final bool isCanLoadMore;
  final bool isHasNetwork;
  final String keyword;

  SearchScreenState copyWith({
    List<FilmModel>? searchFullListFilm,
    List<FilmModel>? searchListFilm,
    bool? isLoading,
    bool? isCanLoadMore,
    bool? isHasNetwork,
    String? keyword,
  }) {
    return SearchScreenState(
      searchFullListFilm: searchFullListFilm ?? this.searchFullListFilm,
      searchListFilm: searchListFilm ?? this.searchListFilm,
      isLoading: isLoading ?? this.isLoading,
      isCanLoadMore: isCanLoadMore ?? this.isCanLoadMore,
      isHasNetwork: isHasNetwork ?? this.isHasNetwork,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  List<Object?> get props => [
        searchFullListFilm,
        searchListFilm,
        isLoading,
        isCanLoadMore,
        isHasNetwork,
        keyword,
      ];
}
