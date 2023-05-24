import '../db_connection.dart';
import '../model/ItemModel.dart';

class ItensService {
  Future<int> createItem(ItemModel item) async {
    final conn = await DbConnection.connect();
    final result = await conn.query(
      'INSERT INTO produto (name, description, image) VALUES (?, ?, ?)',
      [item.name, item.description, item.image],
    );
    await conn.close();
    return result.insertId!;
  }

  Future<ItemModel?> getItem(int id) async {
    final conn = await DbConnection.connect();
    final result = await conn.query(
      'SELECT * FROM produto WHERE id = ?',
      [id],
    );
    await conn.close();
    if (result.isNotEmpty) {
      return ItemModel.fromMap(result.first.fields);
    }
    return null;
  }

  Future<List<ItemModel>> getAllItems() async {
    final conn = await DbConnection.connect();
    final result = await conn.query('SELECT * FROM produto');
    await conn.close();
    return result.map((row) => ItemModel.fromMap(row.fields)).toList();
  }

  Future<int?> updateItem(int id, ItemModel newItem) async {
    final conn = await DbConnection.connect();
    final result = await conn.query(
      'UPDATE produto SET name = ?, description = ?, image = ? WHERE id = ?',
      [newItem.name, newItem.description, newItem.image, id],
    );
    await conn.close();
    return result.affectedRows;
  }

  Future<int?> deleteItem(int id) async {
    final conn = await DbConnection.connect();
    final result = await conn.query(
      'DELETE FROM produto WHERE id = ?',
      [id],
    );
    await conn.close();
    return result.affectedRows;
  }
}