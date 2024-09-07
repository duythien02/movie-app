import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
