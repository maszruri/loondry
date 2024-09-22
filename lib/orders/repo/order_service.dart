import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class OrderService {
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sql.db',
      version: 1,
      onCreate: (db, version) async {
        debugPrint("creating table..");
        await db.execute("""CREATE TABLE orders(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    description TEXT,
    createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
      },
    );
  }

  static Future<int> createItems(String title, String? description) async {
    final db = await OrderService.db();

    final data = {'title': title, 'description': description};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await OrderService.db();
    return db.query('items', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await OrderService.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await OrderService.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await OrderService.db();
    try {
      await db.delete('items', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
