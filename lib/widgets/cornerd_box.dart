import 'package:flutter/material.dart';
import 'package:shared_app/skins/base.dart';

class CorneredBox extends StatelessWidget {
  final Widget child;
  final double? height;
  final double radius;
  final double padding;
  const CorneredBox({
    Key? key,
    required this.child,
    this.height,
    this.radius = 30,
    this.padding = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: height == null ? const BoxConstraints.expand() : null,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: box2.copyWith(borderRadius: BorderRadius.circular(radius)),
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
