import 'package:flutter/cupertino.dart';
import '../skins/base.dart';

class AppRouter {
  static navigate(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => AppTheme(child: page)),
    );
  }
}
