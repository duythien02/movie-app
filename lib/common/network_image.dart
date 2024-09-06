import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({super.key, required this.url, required this.radius});
  final String url;
  final BorderRadius radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(
          url,
        ),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 143.sp,
              height: 212.sp,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: radius,
              ),
            ),
          );
        },
      ),
    );
  }
}
