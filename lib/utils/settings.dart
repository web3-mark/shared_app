import 'package:shared_preferences/shared_preferences.dart';

enum SettingKey {
  /// 语言
  language,

  /// 生物识别, 解锁
  // bio,
  didAuthenticate,

  /// 货币
  currency,

  /// 指纹支付
  payment,

  /// 地址类型
  addressType,

  // 钱包
  wallet
}

saveSetting(SettingKey key, value) async {
  final ins = await SharedPreferences.getInstance();
  switch (value.runtimeType) {
    case int:
      await ins.setInt(key.name, value);
      break;

    case String:
      await ins.setString(key.name, value);
      break;
    default:
  }
}

Future getSetting(SettingKey key, Type type) async {
  final ins = await SharedPreferences.getInstance();
  switch (type) {
    case int:
      return ins.getInt(key.name);
    case String:
      return ins.getString(key.name);
    default:
  }
}

Future setCurrentWallet(int id) async {
  return saveSetting(SettingKey.wallet, id);
}

Future getCurrentWallet() async {
  return getSetting(SettingKey.wallet, int);
}
