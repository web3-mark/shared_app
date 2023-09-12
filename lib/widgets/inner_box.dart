import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/skins/base.dart';

class InnerBox extends StatelessWidget {
  final double top;

  final Widget child;
  final double height;
  final Color? fillColor;

  const InnerBox({
    super.key,
    this.top = 14,
    required this.child,
    this.height = 44,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().scaleHeight * height,
      margin: EdgeInsets.only(top: top),
      decoration: fillColor == null ? box1 : box1.copyWith(color: fillColor),
      child: child,
    );
  }
}
