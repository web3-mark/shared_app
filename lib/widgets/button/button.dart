import 'package:flutter/material.dart';
import 'package:shared_app/skins/base.dart';

const double defaultHeight = 48;
const double defaultRadius = 24;

class BlockButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  /// 默认高度 48
  final double height;
  final double radius;
  final Color? color;
  final bool gradient;

  final double? width;

  const BlockButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height = defaultHeight,
    this.radius = defaultRadius,
    this.color,
    this.gradient = false,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = gradient
        ? BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color ?? primaryColor,
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFF6E59D5),
                Color(0xFF879EFA),
              ],
            ),
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color ?? primaryColor,
          );
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double radius;
  final Color? color;
  final double? width;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height = defaultHeight,
    this.radius = defaultRadius,
    this.color,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color ?? primaryColor,
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF6E59D5),
              Color(0xFF879EFA),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double? width;
  final double radius;
  final Color? color;
  final bool gradient;

  const GhostButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height = defaultHeight,
    this.radius = defaultRadius,
    this.color,
    this.gradient = false,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: color ?? primaryColor),
    );
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          text,
          style: SemiBoldText.copyWith(
            color: primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
