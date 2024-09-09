import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';
import '../constants/assets.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, required this.tryAgain});
  final void Function() tryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 60.sp,
            width: 60.sp,
            child: Image.asset(
              Assets.assetsImagesNoInternet,
            ),
          ),
          Text(
            StringConstants.noInternet,
            style: TextStyle(
              color: const Color(ColorConstants.dark),
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          Text(
            StringConstants.checkYourInternet,
            style: TextStyle(
              color: const Color(ColorConstants.dark),
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          GestureDetector(
            onTap: tryAgain,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sp,
                vertical: 4.sp,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                border: Border.all(
                  color: const Color(ColorConstants.gray),
                ),
              ),
              child: Text(
                StringConstants.tryAgain,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(ColorConstants.gray),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
