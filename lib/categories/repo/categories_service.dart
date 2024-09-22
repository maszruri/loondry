import 'package:flutter/material.dart';
import 'package:loondry/categories/models/categories_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CategoriesService {
  static Future<sql.Database> categoriesDb() async {
    return sql.openDatabase(
      'sql.db',
      version: 1,
      onCreate: (db, version) async {
        debugPrint("creating table..");
        await db.execute("""CREATE TABLE categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    price INTEGER,
    minimumWeight INTEGER,
    duration INTEGER
    )
    """);
      },
    );
  }

  static Future<void> createCategories(CategoriesModel categories) async {
    final db = await CategoriesService.categoriesDb();

    await db.insert('categories', categories.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getCategories() async {
    final db = await CategoriesService.categoriesDb();
    return db.query('categories', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> queryCategories(int id) async {
    final db = await CategoriesService.categoriesDb();
    return db.query('categories', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateCategories(CategoriesModel categories) async {
    final db = await CategoriesService.categoriesDb();
    final result = await db.update('categories', categories.toMap(),
        where: "id = ?", whereArgs: [categories.id]);
    return result;
  }

  static Future<void> deleteCategories(int id) async {
    final db = await CategoriesService.categoriesDb();
    try {
      await db.delete('categories', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
