import 'dart:async';
import 'package:path/path.dart';
import 'package:photolike_app/domain/photo.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();
  DatabaseHelper._();

  late Database db;
  
  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    String path = await getDatabasesPath();
    db = await openDatabase(
      join(path, 'photolike_database.db'),
      onCreate: (database, version) async {
        await database.execute('CREATE TABLE photos(id PRIMARY KEY, name TEXT, favorite BOOLEAN)');
      }
    );
  }

  Future<int> insertPhoto(Photo photo) async {
    int result = await db.insert('photos', photo.toMap());
    return result;
  }

  Future<int> updateFavorite(Photo photo) async {
    int result = await db.update(
      'photos', 
      photo.toMap(), 
      where: 'id = ?', 
      whereArgs: [photo.id]
    );
    return result;
  }
}