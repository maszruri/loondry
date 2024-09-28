import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqliteDb {
  static Future<sql.Database> loondryDb() async {
    return sql.openDatabase(
      'sql.db',
      version: 1,
      onCreate: (db, version) async {
        debugPrint("creating customers table..");
        await db.execute("""CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    phone TEXT,
    address TEXT
    )
    """);
        debugPrint("creating categories table..");

        await db.execute("""CREATE TABLE categories(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name TEXT,
    price INTEGER,
    minimumWeight INTEGER,
    duration INTEGER
    )
    """);
        debugPrint("creating orders table..");

        await db.execute("""CREATE TABLE orders(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        customerName TEXT,
        customerPhone TEXT,
        categoriesName TEXT,
        categoriesPrice INTEGER,
        categoriesDuration INTEGER,
        weight REAL,
        totalPrice INTEGER,
        startedAt TEXT,
        finisedAt TEXT,
        FOREIGN KEY(customerName) REFERENCES customers(name),
        FOREIGN KEY(customerPhone) REFERENCES customers(phone),
        FOREIGN KEY(categoriesName) REFERENCES categories(name),
        FOREIGN KEY(categoriesPrice) REFERENCES categories(price),
        FOREIGN KEY(categoriesDuration) REFERENCES categories(duration)
        )""");
      },
    );
  }
}
