import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../route/controllers.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 20.sp),
          child: child,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(76.sp);
}

class SimpleChildAppBar extends StatelessWidget {
  const SimpleChildAppBar({super.key, required this.titleAppBar});
  final String titleAppBar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: AppNavigatorControllers.backPreScreen,
          child: Container(
            margin: EdgeInsets.only(right: 10.sp),
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Text(
          titleAppBar,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: const Color.fromRGBO(68, 68, 95, 1),
          ),
        ),
        SizedBox(
          height: 40.sp,
          width: 40.sp,
        ),
      ],
    );
  }
}
