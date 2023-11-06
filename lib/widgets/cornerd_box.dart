import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/skins/base.dart';

class CorneredBox extends StatelessWidget {
  final Widget child;
  final double? height;
  final double padding;
  const CorneredBox({
    Key? key,
    required this.child,
    this.height,
    this.padding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: height == null ? BoxConstraints.expand() : null,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: box2,
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
