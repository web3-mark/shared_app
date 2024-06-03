import 'db.dart';

class Model {
  final Tables table;

  Model({required this.table});

  list() async {
    final map = await db.query(
      table.name,
    );
    return map.toList();
  }

  find({String? where, List<Object?>? whereArgs}) async {
    return await db.query(table.name, where: where, whereArgs: whereArgs);
  }

  save(Map<String, dynamic> data) async {
    return await db.insert(table.name, data);
  }

  delete({String? where, List<Object?>? whereArgs}) async {
    return await db.delete(table.name, where: where, whereArgs: whereArgs);
  }
}
