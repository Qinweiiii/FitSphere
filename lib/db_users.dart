import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseUsers {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      uname TEXT,
      email TEXT,
      password TEXT
    )
    """);
  }

  // Future 代表一个可能在将来某个时间点完成的异步操作的结果
  static Future<sql.Database> db() async {
    try {
      var databasesPath = await sql.getDatabasesPath();
      String path = databasesPath + 'users.db';
      return sql.openDatabase(
        path,
        version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTable(database);
        },
      );
    } catch (e) {
      debugPrint('Error opening database: $e');
      rethrow;
    }
  }


  static Future<int> createItem(String uname, String email, String password) async {
    final db = await DatabaseUsers.db();
    final data = {'uname': uname, 'email': email, 'password': password};
    final id = await db.insert(
        'items',
        data,
        // conflictAlgorithm 用于指定插入冲突时的处理方式
        conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseUsers.db();
    return db.query('items', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async{
    final db = await DatabaseUsers.db();
    return db.query('items', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<void> deleteAllItems() async {
    final db = await DatabaseUsers.db();
    try {
      await db.delete('items');
    } catch(err) {
      debugPrint('Something went wrong: $err');
    }
  }

}