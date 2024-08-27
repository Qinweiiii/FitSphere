import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseService {
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE items (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      date TEXT,
      description TEXT
    )
    """);
  }

  // Future 代表一个可能在将来某个时间点完成的异步操作的结果
  static Future<sql.Database> db() async {
    // 打开一个数据库 如果数据库不存在则创建它
    return sql.openDatabase(
      'moods.db',
      version: 1,
      // 在数据库第一次创建时调用 用于创建表
      onCreate: (sql.Database database, int version) async {
        // 等待异步操作完成并获取它的结果
        await createTable(database);
      }
    );
  }

  static Future<int> createItem(String date, String? description) async {
    final db = await DatabaseService.db();
    final data = {'date': date, 'description': description ?? '',};
    final id = await db.insert(
      'items',
      data,
      // conflictAlgorithm 用于指定插入冲突时的处理方式
      conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DatabaseService.db();
    return db.query('items', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getItem(int id) async{
    final db = await DatabaseService.db();
    return db.query('items', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(int id, String date, String? description) async {
    final db = await DatabaseService.db();
    final data = {
      'date': date,
      'description': description ?? '',
    };
    final result = await db.update('items', data, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  static Future<void> deleteItem(int id) async {
    final db = await DatabaseService.db();
    try {
      await db.delete('items', where: 'id = ?', whereArgs: [id]);
    }catch(err) {
      debugPrint('Something went wrong: $err');
    }
  }
}