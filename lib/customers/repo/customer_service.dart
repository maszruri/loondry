import 'package:flutter/material.dart';
import 'package:loondry/customers/models/customer_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CustomerService {
  static Future<sql.Database> customerDb() async {
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
      },
    );
  }

  static Future<void> createCustomer(CustomerModel customer) async {
    final db = await CustomerService.customerDb();

    await db.insert('customers', customer.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getCustomers() async {
    final db = await CustomerService.customerDb();
    return db.query('customers', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getCustomer(int id) async {
    final db = await CustomerService.customerDb();
    return db.query('customers', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateCustomer(CustomerModel customer) async {
    final db = await CustomerService.customerDb();
    final result = await db.update('customers', customer.toMap(),
        where: "id = ?", whereArgs: [customer.id]);
    return result;
  }

  static Future<void> deleteCustomer(int id) async {
    final db = await CustomerService.customerDb();
    try {
      await db.delete('customers', where: 'id = ?', whereArgs: [id]);
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
