import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

extension FontWeightExt on FontWeight {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static FontWeight medium =
      Platform.isAndroid ? FontWeight.w600 : FontWeight.w500;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

const primaryColor = Color(0XFF4536A0);

const grayColor1 = Color(0xFFF7F8FA);

const grayColor2 = Color(0xFF212121);

const grayColor3 = Color(0xFFCCDAF1);

const blackColor1 = Color(0xFF1F314A);

const blackColor3 = Color(0xFF999999);

const blackColor4 = Color(0xFF5C5C5C);

const greenColor = Color(0xFF04B580);

const dividerColor = Color(0x33F7F8FA);

const whiteColor1 = Color(0x0F000000);

const hintColor = Color(0xFFD8D8D8);

const borderColor = Color(0xFFEFEFEF);

const linkColor = Color(0xFF4F7FE3);

const successColor = Color(0xFF04B580);

const errorColor = Color(0xFFE04C4C);

const shadow1 = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  ),
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 2),
      color: whiteColor1,
      blurRadius: 15,
    )
  ],
);

const box1 = BoxDecoration(
  color: grayColor1,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(4),
    topRight: Radius.circular(4),
    bottomLeft: Radius.circular(4),
    bottomRight: Radius.circular(4),
  ),
);

const box2 = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
  gradient: LinearGradient(
    colors: [
      Color(0xFFE6ECFF),
      Color(0xFFFFFFFF),
    ],
    stops: [0, 0.1],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

class AppTheme extends StatelessWidget {
  final Widget child;

  const AppTheme({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          // titleTextStyle: TextStyle(fontSize: 18),
          titleTextStyle: TextStyle(
            fontSize: 18.sp,
            color: Colors.grey.shade900,
            fontWeight: FontWeightExt.medium,
          ),
          // surfaceTintColor: Colors.red,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        // textButtonTheme:TextButtonThemeData(

        // )
      ),
      child: child,
    );
  }
}

class AppColor {
  static const Color text1 = blackColor4;

  static const Color text2 = blackColor1;

  static const Color text3 = blackColor3;

  static const Color text4 = grayColor2;

  static const Color primary = primaryColor;
}

const SemiBoldText = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: "PingFangRegular",
);

const BoldText = TextStyle(
  fontWeight: FontWeightExt.bold,
);

final MediumText = TextStyle(
  fontWeight: FontWeightExt.medium,
  fontFamily: "PingFangMedium",
);

const RegularText = TextStyle(
  fontWeight: FontWeightExt.regular,
  fontFamily: "PingFangRegular",
);
