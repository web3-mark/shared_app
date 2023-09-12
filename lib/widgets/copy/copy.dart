import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CopyWidget extends StatelessWidget {
  final String text;
  final Widget child;
  const CopyWidget({super.key, required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // showtoa
        BotToast.showText(text: "已复制".tr);
        Clipboard.setData(ClipboardData(text: text));
      },
      child: child,
    );
  }
}

class CopyIcon extends StatelessWidget {
  final Color color;
  const CopyIcon({super.key, this.color = const Color(0xFF5C5C5C)});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage("assets/common/copy_icon.png"),
      width: 12.sp,
      height: 12.sp,
      color: color,
    );
  }
}
