import 'dart:math';
import 'utils.dart';

getGas() {
  // 返回 0.010-0.015之间的随机数
  return dp(Random().nextDouble() * 0.005 + 0.011, 3);
}
