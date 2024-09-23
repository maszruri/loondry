import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqliteDb {
  static Future<sql.Database> loondryDb() async {
    return sql.openDatabase(
      'sql.db',
      version: 1,
      onCreate: (db, version) async {
        debugPrint("creating table..");
        await db.execute("""CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    phone TEXT,
    address TEXT
    )
    """);
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
}
