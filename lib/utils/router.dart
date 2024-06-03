import 'package:flutter/cupertino.dart';
import '../skins/base.dart';

class AppRouter {
  static navigate(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => AppTheme(child: page)),
    );
  }

  // static navigateNamed(BuildContext context, String name) {
  //   return Navigator.of(context).pushNamed(
  //     CupertinoPageRoute(builder: (context) => AppTheme(child: page)),
  //   );
  // }
}
