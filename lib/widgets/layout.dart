import 'package:flutter/material.dart';

class GlobalLayout extends StatelessWidget {
  final Widget child;
  const GlobalLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
      ),
      child: child,
    );
  }
}
