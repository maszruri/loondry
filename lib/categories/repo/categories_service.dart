import 'package:flutter/material.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:loondry/shared/local_storage/sqlite_db.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CategoriesService {
  static Future<void> createCategories(CategoriesModel categories) async {
    final db = await SqliteDb.loondryDb();

    await db.insert('categories', categories.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await SqliteDb.loondryDb();
    return db.query('categories', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> queryCategories(int id) async {
    final db = await SqliteDb.loondryDb();
    return db.query('categories', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateCategories(CategoriesModel categories) async {
    final db = await SqliteDb.loondryDb();
    final result = await db.update('categories', categories.toMap(),
        where: "id = ?", whereArgs: [categories.id]);
    return result;
  }

  static Future<void> deleteCategories(int id) async {
    final db = await SqliteDb.loondryDb();
    try {
      await db.delete('categories', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
