import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.titleEp});
  final String titleEp;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.sp, vertical: 2.sp),
        alignment: Alignment.bottomLeft,
        width: 150.sp,
        height: 30.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(5.sp),
          ),
          gradient: LinearGradient(
            colors: [
              const Color(ColorConstants.dark).withOpacity(0.8),
              const Color(ColorConstants.dark).withOpacity(0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Text(
          titleEp,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
          ),
        ),
      ),
    );
  }
}
