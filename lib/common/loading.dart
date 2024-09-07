import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movye/constants/app_constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 20.sp,
        height: 20.sp,
        child: const CircularProgressIndicator(
          color: Color(ColorConstants.primaryOrange),
        ),
      ),
    );
  }
}
