import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

maskString(String origin, [int start = 4]) {
  if (origin.length < 10) {
    return origin;
  }
  return origin.replaceRange(start, origin.length - start, "****");
}

/// 浮点数取精确位
/// 默认3位整数
/// 1.0 -> 1.0
/// 1.23232 -> 1.232
///
double dp(double val, [int places = 4]) {
  num mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}

class HexUtils {
  static String uint8ToHex(Uint8List byteArr) {
    if (byteArr.isEmpty) {
      return "";
    }
    Uint8List result = Uint8List(byteArr.length << 1);
    var hexTable = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'A',
      'B',
      'C',
      'D',
      'E',
      'F'
    ]; //16进制字符表
    for (var i = 0; i < byteArr.length; i++) {
      var bit = byteArr[i]; //取传入的byteArr的每一位
      var index = bit >> 4 & 15; //右移4位,取剩下四位
      var i2 = i << 1; //byteArr的每一位对应结果的两位,所以对于结果的操作位数要乘2
      result[i2] = hexTable[index].codeUnitAt(0); //左边的值取字符表,转为Unicode放进resut数组
      index = bit & 15; //取右边四位
      result[i2 + 1] =
          hexTable[index].codeUnitAt(0); //右边的值取字符表,转为Unicode放进resut数组
    }
    return String.fromCharCodes(result); //Unicode转回为对应字符,生成字符串返回
  }

  static Uint8List hexToUint8List(String hex) {
    if (hex.length % 2 != 0) {
      throw 'Odd number of hex digits';
    }
    var l = hex.length ~/ 2;
    var result = Uint8List(l);
    for (var i = 0; i < l; ++i) {
      var x = int.parse(hex.substring(2 * i, 2 * (i + 1)), radix: 16);
      if (x.isNaN) {
        throw 'Expected hex string';
      }
      result[i] = x;
    }
    return result;
  }
}

class DateTimeUtils {
  /// 时间戳返回日期
  static fromTimeStamp(int time) {
    return DateTime.fromMillisecondsSinceEpoch(time * 1000)
        .toString()
        .substring(0, 19);
  }
}

/// 推出键盘
dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}
