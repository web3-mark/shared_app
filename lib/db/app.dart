import 'package:get/get.dart';
import 'package:shared_app/db/db.dart';
import 'package:shared_app/utils/settings.dart';

// ignore: constant_identifier_names
const TableName = "wallets";

final loadedWallets = [].obs;

final currentWallet = 0.obs;

getWalletsFromDB() async {
  // final db = await LocalDB.instance.database;
  final map = await db.query(
    TableName,
  );
  return map.toList();
}

/// 保存钱包, 并更新weight
saveWalletToDB(String secret, Map<String, dynamic> json) async {
  // final db = await LocalDB.instance.database;
  Map<String, dynamic> row = {};
  row.addAll(json);
  row['secret'] = secret;
  int id = await db.insert(TableName, row);
  await setCurrentWallet(id);
  await LoadWallets();
}

updatePasswor(int id, String password) async {
  // final db = await LocalDB.instance.database;
  return await db.update(
    TableName,
    {"password": password},
    where: "id=?",
    whereArgs: [id],
  );
}

Future deleleWallet(id) async {
  // final db = await LocalDB.instance.database;
  return await db.delete(
    TableName,
    where: "id=?",
    whereArgs: [id],
  );
}

Future getNextWallet() async {
  // final db = await LocalDB.instance.database;
  await db.query(TableName);
}

Future LoadWallets({onlyload = false}) async {
  // final db = await LocalDB.instance.database;
  final res = await db.query(TableName);
  loadedWallets.replaceRange(0, loadedWallets.length, res);
  if (!onlyload) {
    var id = await getCurrentWallet();
    currentWallet(id);
  }
}

saveWalletFields(int wallet, Map<String, dynamic> data) async {
  if (data['name'] != null && data['name'].length > 12) {
    throw Exception("名称长度不能超过12位".tr);
  }

  // final db = await LocalDB.instance.database;
  await db.update(TableName, data, where: "id=?", whereArgs: [wallet]);
}
