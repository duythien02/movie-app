import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/common/loading.dart';
import 'package:movye/common/no_internet.dart';
import 'package:movye/common/shimmer.dart';
import 'package:movye/route/controllers.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../bloc/search_screen/search_screen_bloc.dart';
import '../../common/appbar.dart';
import '../../common/list_item.dart';
import '../../common/search_bar.dart';
import '../../constants/app_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.keyWord});
  final String keyWord;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchBloc = SearchScreenBloc();
  @override
  void initState() {
    super.initState();
    _searchBloc.textController.text = widget.keyWord;
    _searchBloc.add(const ShowResultSearch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _searchBloc,
      child: BlocBuilder<SearchScreenBloc, SearchScreenState>(
        bloc: _searchBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: AppNavigatorControllers.backPreScreen,
                    child: Container(
                      margin: EdgeInsets.only(right: 10.sp),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Expanded(
                    child: MySearchBar(
                      onSubmitted: (value) {
                        _searchBloc.add(const ShowResultSearch());
                      },
                      onTapOutside: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      onDelete: _searchBloc.textController.clear,
                      controller: _searchBloc.textController,
                      autoFocus: false,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (state.isHasNetwork) ...[
                    SizedBox(
                      height: 8.sp,
                    ),
                    Text(
                      '${StringConstants.resultSearch}  "${_searchBloc.textController.text}"',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: const Color(ColorConstants.gray),
                      ),
                    ),
                  ],
                  SizedBox(
                    height: 16.sp,
                  ),
                  !state.isLoading
                      ? state.isHasNetwork
                          ? state.searchListFilm != null &&
                                  state.searchListFilm!.isNotEmpty
                              ? Expanded(
                                  child: SmartRefresher(
                                    controller: _searchBloc.refreshController,
                                    enablePullDown: false,
                                    enablePullUp: state.isCanLoadMore,
                                    footer: CustomFooter(
                                      builder: (context, mode) {
                                        Widget body;
                                        if (mode == LoadStatus.loading) {
                                          body = const Loading();
                                        } else if (mode == LoadStatus.noMore) {
                                          body = Text(
                                            StringConstants.endScreen,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(
                                                ColorConstants.gray,
                                              ),
                                            ),
                                          );
                                        } else {
                                          body = const Text('');
                                        }
                                        return SizedBox(
                                          height: 55.sp,
                                          child: Center(
                                            child: body,
                                          ),
                                        );
                                      },
                                    ),
                                    onLoading: () {
                                      _searchBloc.add(const LoadMore());
                                    },
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: List.generate(
                                            state.searchListFilm!.length,
                                            (index) {
                                          final film =
                                              state.searchListFilm![index];
                                          String urlImg =
                                              AppConstants.apiFilmImg +
                                                  film.thumpUrl;
                                          return Column(
                                            children: [
                                              ListItem(
                                                film: film,
                                                urlImg: urlImg,
                                              ),
                                              SizedBox(
                                                height: 10.sp,
                                              )
                                            ],
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                )
                              //shimmer
                              : Center(
                                  child: Text(
                                    StringConstants.noResult,
                                    style: TextStyle(
                                      color: const Color(ColorConstants.dark),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                          : NoInternet(
                              tryAgain: () {
                                _searchBloc.add(const ShowResultSearch());
                              },
                            )
                      : const Expanded(
                          child: MyShimmerList(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
