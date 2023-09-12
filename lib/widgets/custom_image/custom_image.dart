import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/skins/base.dart';

/**
 * url
 */
class CustomImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double radius;
  const CustomImage({
    super.key,
    required this.url,
    required this.width,
    this.height = 45,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    Widget empty = Container(
      width: width,
      height: height,
      color: AppColor.text3.withOpacity(0.3),
    );

    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(radius),
      child: url.isNotEmpty
          ? Image.network(
              url,
              fit: BoxFit.cover,
              width: width,
              height: height,
              loadingBuilder: (context, child, event) {
                return Center(child: child);
              },
              errorBuilder: (context, error, stackTrace) {
                return empty;
              },
            )
          : empty,
    );
  }
}
