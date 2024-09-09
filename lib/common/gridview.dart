import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/models/film_model.dart';

import '../constants/app_constants.dart';
import 'episode.dart';
import 'network_image.dart';
import 'shimmer.dart';

class MyGridView extends StatelessWidget {
  const MyGridView.home({
    super.key,
    this.listFilm,
    required this.isExpand,
  });
  const MyGridView.other({
    super.key,
    this.listFilm,
  }) : isExpand = true;
  final List<FilmModel>? listFilm;
  final bool isExpand;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 4.sp,
        mainAxisSpacing: 8.sp,
        childAspectRatio: 0.38.sp,
        children: listFilm != null && listFilm!.isNotEmpty
            ? List.generate(
                isExpand ? listFilm!.length : 6,
                (index) {
                  final film = listFilm![index];
                  String urlImg = AppConstants.apiFilmImg + film.posterUrl;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 212.sp,
                            child: MyNetworkImage(
                              url: urlImg,
                              radius: BorderRadius.circular(5.sp),
                            ),
                          ),
                          Positioned.fill(
                            child: Episode(
                              titleEp: film.type != 'series'
                                  ? film.quality ?? ''
                                  : film.episodeCurrent ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.sp,
                        ),
                        child: Text(
                          film.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(ColorConstants.dark),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  );
                },
              )
            //shimmer
            : List.generate(
                6,
                (index) {
                  return Column(
                    children: [
                      MyShimmer(
                        height: 212.sp,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                      ),
                      SizedBox(
                        height: 8.sp,
                      ),
                      MyShimmer(
                        height: 16.sp,
                        width: 143.sp,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
