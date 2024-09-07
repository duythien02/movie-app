import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movye/models/film_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../api/api_app.dart';

part 'search_screen_event.dart';
part 'search_screen_state.dart';

class SearchScreenBloc extends Bloc<SearchScreenEvent, SearchScreenState> {
  int index = 0;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final TextEditingController textController = TextEditingController();

  SearchScreenBloc() : super(const SearchScreenState()) {
    on<ShowResultSearch>(_onInitSearchScreen);
    on<LoadMore>(_onLoadMore);
  }

  Future<void> _onInitSearchScreen(
      ShowResultSearch event, Emitter<SearchScreenState> emit) async {
    if (event.keyword.trim().isEmpty) {
      textController.clear();
      return;
    }

    if (state.keyword.trim() == event.keyword.trim()) {
      return;
    }
    index = 0;
    emit(state.copyWith(
      searchListFilm: [],
      searchFullListFilm: [],
      isLoading: true,
      isCanLoadMore: false,
      keyword: event.keyword.trim(),
    ));
    final listSearch = await HandleResponseApi.handleApiListSearch(
      limit: 100,
      keyword: event.keyword.trim(),
    );
    if (listSearch.length > 12) {
      emit(
        state.copyWith(
          isLoading: false,
          searchFullListFilm: listSearch,
          searchListFilm: listSearch.sublist(index, index += 12),
          isCanLoadMore: true,
        ),
      );
    } else if (listSearch.length <= 12) {
      emit(
        state.copyWith(
          isLoading: false,
          searchFullListFilm: listSearch,
          searchListFilm: listSearch.sublist(
            index,
            index += listSearch.length - index,
          ),
          isCanLoadMore: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          searchFullListFilm: listSearch,
          searchListFilm: [],
          isCanLoadMore: false,
        ),
      );
    }
  }

  Future<void> _onLoadMore(
    LoadMore event,
    Emitter<SearchScreenState> emit,
  ) async {
    final List<FilmModel> listMoreSearch;
    await Future.delayed(const Duration(milliseconds: 500));
    if (index + 12 < state.searchFullListFilm!.length) {
      listMoreSearch = state.searchFullListFilm!.sublist(
        index,
        index += 12,
      );
    } else {
      listMoreSearch = state.searchFullListFilm!.sublist(
        index,
        index += (state.searchFullListFilm!.length - index),
      );
    }
    if (index == state.searchFullListFilm!.length) {
      refreshController.footerMode!.value = LoadStatus.noMore;
    }
    emit(
      state.copyWith(
        searchListFilm: [...state.searchListFilm!, ...listMoreSearch],
      ),
    );
    refreshController.loadComplete();
  }
}
