import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../models/film_model.dart';
import '../route/controllers.dart';
import 'episode.dart';
import 'network_image.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.film, required this.urlImg});
  final FilmModel film;
  final String urlImg;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: () {
          AppNavigatorControllers.moveToPlayFilmScreen(filmSlug: film.slug);
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 150.sp,
                  height: 80.sp,
                  child: MyNetworkImage(
                    url: urlImg,
                    radius: BorderRadius.circular(5.sp),
                  ),
                ),
                Episode(
                  titleEp: film.type != 'series'
                      ? film.quality ?? ''
                      : film.episodeCurrent ?? '',
                ),
              ],
            ),
            SizedBox(
              width: 16.sp,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    film.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(
                        ColorConstants.dark,
                      ),
                    ),
                  ),
                  Text(
                    film.lang ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(ColorConstants.gray),
                    ),
                  ),
                  Text(
                    film.time ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(ColorConstants.gray),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
