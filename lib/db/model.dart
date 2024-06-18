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

  Future<List> find({String? where, List<Object?>? whereArgs}) async {
    return await db.query(table.name, where: where, whereArgs: whereArgs);
  }

  save(Map<String, dynamic> data) async {
    return await db.insert(table.name, data);
  }

  delete({String? where, List<Object?>? whereArgs}) async {
    return await db.delete(table.name, where: where, whereArgs: whereArgs);
  }

  update({
    required String where,
    required Map<String, dynamic> data,
    List<Object?>? whereArgs,
  }) async {
    return await db.update(table.name, data,
        where: where, whereArgs: whereArgs);
  }
}
