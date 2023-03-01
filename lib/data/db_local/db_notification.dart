import 'dart:io';

import 'package:ebeasiswa/data/model/notification_local/notification_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbLocalNotification {
  final String _databaseName = 'notification_database.db';
  final int _databaseVersiom = 3;

  //tabel notif
  final String tbNotification = 'notification';
  final String id = 'id';
  final String firestoreId = 'firestoreId';
  final String uid = 'uid';
  final String username = 'username';
  final String title = 'title';
  final String body = 'body';
  final String icons = 'icons';
  final String images = 'images';
  final String createdAt = 'createdAt';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabse();
    return _database!;
  }

  Future<Database> _initDatabse() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return openDatabase(path, version: _databaseVersiom, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tbNotification ($id INTEGER PRIMARY KEY, $firestoreId TEXT NULL, $uid TEXT NULL, $username TEXT NULL, $title TEXT NULL, $body TEXT NULL, $icons TEXT NULL, $images TEXT NULL, $createdAt TEXT NULL)');
  }

  Future<List<NotificationModel>> all() async {
    final data = await _database!.query(tbNotification);
    List<NotificationModel> result =
        data.map((e) => NotificationModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(tbNotification, row);
    return query;
  }

  Future<int> update(int idParams, Map<String, dynamic> row) async {
    final query = await _database!
        .update(tbNotification, row, where: '$id = ?', whereArgs: [idParams]);
    return query;
  }

  Future<int> delete(int idParams) async {
    final query = await _database!
        .delete(tbNotification, where: '$id = ?', whereArgs: [idParams]);
    return query;
  }
}
