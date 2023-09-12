import 'package:flutter/material.dart';

const boxGradientDecoration = BoxDecoration(
  color: Color(0xffF7F9FC),
  image: DecorationImage(
    fit: BoxFit.fitWidth,
    alignment: Alignment.topCenter,
    image: AssetImage("assets/bg/gradient_bg.png"),
  ),
);

class BackgroundBox extends StatelessWidget {
  final Widget child;
  const BackgroundBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxGradientDecoration,
      child: child,
    );
  }
}
