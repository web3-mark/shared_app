import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordVisibleWidget extends StatefulWidget {
  final Widget Function(bool) builder;
  const PasswordVisibleWidget({super.key, required this.builder});

  @override
  State<PasswordVisibleWidget> createState() => _PasswordVisibleWidgetState();
}

class _PasswordVisibleWidgetState extends State<PasswordVisibleWidget> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.builder(secure),
        Positioned(
          right: 10.sp,
          top: 12.sp,
          child: GestureDetector(
            onTap: () {
              setState(() {
                secure = !secure;
              });
            },
            child: Image(
              image: AssetImage(
                !secure ? "assets/wallet/show.png" : "assets/wallet/hide.png",
              ),
            ),
          ),
        )
      ],
    );
  }
}
