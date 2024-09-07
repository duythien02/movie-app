import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_constants.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.onTapOutside,
    required this.onSubmitted,
    required this.onDelete,
    required this.controller,
    required this.autoFocus,
  });
  final void Function() onTapOutside;
  final void Function(String keyword) onSubmitted;
  final void Function() onDelete;
  final TextEditingController controller;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        onTapOutside();
      },
      onSubmitted: (value) {
        onSubmitted(value);
      },
      controller: controller,
      autofocus: autoFocus,
      maxLines: 1,
      cursorColor: const Color(ColorConstants.dark),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 10.sp,
        ),
        hintText: StringConstants.keyWord,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: const Color(ColorConstants.gray),
        ),
        suffixIcon: GestureDetector(
          onTap: onDelete,
          child: const Icon(
            Icons.close,
            color: Color(ColorConstants.dark),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: const BorderSide(
            color: Color(ColorConstants.dark),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(
            color: const Color(ColorConstants.dark),
            width: 1.sp,
          ),
        ),
      ),
    );
  }
}
