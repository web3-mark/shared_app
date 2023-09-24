import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_app/common/common.dart';

class TokenIcon extends StatelessWidget {
  final TokenInfo token;
  final double size;
  const TokenIcon({super.key, required this.token, this.size = 44});

  @override
  Widget build(BuildContext context) {
    final s = ScreenUtil().scaleWidth * size;
    return SizedBox(
      height: s,
      width: s,
      child: token.logo == null
          ? const Image(
              image: AssetImage("assets/wallet/bnb.png"),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(s),
              child: Image.network(
                token.logo!,
                width: s,
                height: s,
              ),
            ),
    );
  }
}
