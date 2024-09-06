part of 'search_screen_bloc.dart';

sealed class SearchScreenState extends Equatable {
  const SearchScreenState();
  
  @override
  List<Object> get props => [];
}

final class SearchScreenInitial extends SearchScreenState {}
