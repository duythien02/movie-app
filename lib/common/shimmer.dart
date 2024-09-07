import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
    this.height,
    this.width,
    this.margin,
    required this.decoration,
  });
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final BoxDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: margin,
        decoration: decoration,
        height: height,
        width: width,
      ),
    );
  }
}

class MyShimmerList extends StatelessWidget {
  const MyShimmerList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyShimmer(
                height: 80.sp,
                width: 150.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                width: 16.sp,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyShimmer(
                      height: 16.sp,
                      width: 100.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: Colors.grey.shade300,
                      ),
                    ),
                    MyShimmer(
                      height: 16.sp,
                      width: 150.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                    ),
                    MyShimmer(
                      height: 16.sp,
                      width: 150.sp,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: 3,
    );
  }
}
