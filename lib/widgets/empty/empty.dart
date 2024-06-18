import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final String title;
  final String image;
  const EmptyWidget({
    super.key,
    this.title = '暂无数据',
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100.w,
          ),
          Image.asset(
            image,
            width: 88.w,
            height: 60.w,
          ),
          SizedBox(
            height: 10.w,
          ),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xff999999),
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
