import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../constants/app_constants.dart';
import '../models/film_model.dart';
import 'list_item.dart';
import 'loading.dart';
import 'no_internet.dart';
import 'shimmer.dart';

class ListFilm extends StatelessWidget {
  const ListFilm({
    super.key,
    required this.listFilm,
    required this.isHasNetwork,
    required this.refreshController,
    required this.refresh,
    required this.loadMore,
  });
  final RefreshController refreshController;
  final List<FilmModel>? listFilm;
  final bool isHasNetwork;
  final void Function() refresh;
  final void Function() loadMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.sp,
      ),
      child: isHasNetwork
          ? SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              header: const MaterialClassicHeader(
                color: Color(ColorConstants.primaryOrange),
              ),
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
              onRefresh: refresh,
              onLoading: loadMore,
              child: listFilm != null && listFilm!.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          listFilm!.length,
                          (index) {
                            final film = listFilm![index];
                            String urlImg =
                                AppConstants.apiFilmImg + film.thumpUrl;
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
                          },
                        ),
                      ),
                    )
                  : const MyShimmerList(),
            )
          : NoInternet(
              tryAgain: refresh,
            ),
    );
  }
}
