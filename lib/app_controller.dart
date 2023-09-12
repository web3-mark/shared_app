import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  /// 登录token
  final token = ''.obs;

  /// theme
  final theme = 'light'.obs;

  /// 语言
  final locale = ''.obs;

  /// 货币
  final currency = ''.obs;

  ThemeMode get mode {
    if (theme.value == ThemeMode.light.name) {
      return ThemeMode.light;
    }

    return ThemeMode.dark;
  }
}
