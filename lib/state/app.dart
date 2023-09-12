import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_app/constants/constants.dart';
import 'package:shared_app/db/app.dart';

class AppController extends GetxController {
  final coin = 'TON'.obs;

  // final String address;
  final secret = "".obs;

  // final String secret;
  final address = "".obs;

  final name = "".obs;

  final wallet_id = 0.obs;

  final addressType = "V4R2".obs;

  final balance = 0.0.obs;

  final password = "".obs;

  /// 当前币种兑换比列
  final changeRate = 1.0.obs;

  /// 主币价格
  final price = 0.0.obs;

  /// 当前货币
  final currency = Currency.USD.obs;

  bool get isMnemonic => secret.value.split(" ").length == 24;

  // 通用 storage
  final storage = GetStorage();

  /// 创建中的钱包
  final Map<String, dynamic> creating = {
    "name": "",
    "secret": "",
    "password": "",
    "address": "",
    "weight": 0,
  };

  final RxList tokens = [].obs;

  /// 钱包个数
  int get walletCount => loadedWallets.length;

  @override
  Future<void> onInit() async {
    setup();
    super.onInit();
  }

  setup() {
    // 获取地址类型

    if (loadedWallets.isNotEmpty) {
      final item = loadedWallets.where((p0) => p0['id'] == currentWallet.value);
      if (item.isNotEmpty) {
        switchWallet(item.first);
      } else {
        switchWallet(loadedWallets.first);
      }
    }
  }

  switchWallet(Map json) {
    wallet_id(json['id']);
    address(json['address']);
    name(json['name']);
    secret(json['secret']);
    address(json['address']);
    password(json['password']);
  }
}
