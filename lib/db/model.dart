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

  save(Map<String, dynamic> data) async {
    return await db.insert(table.name, data);
  }

  delete(String? where) async {
    return await db.delete(table.name, where: where);
  }
}
