import 'package:coffee_ui/datamodel/getterSetter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    _db ??= await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'coffee.db');

    print("📁 SQLite DB Path: $path");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE coffee(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            category TEXT,
            description TEXT,
            image TEXT,
            cost REAL
          )
        ''');
      },
    );
  }

  Future<int> insertCoffee(Coffee coffee) async {
    final dbClient = await db;
    return await dbClient.insert('coffee', coffee.toMap());
  }

  Future<List<Coffee>> fetchCoffee() async {
    final dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('coffee');
    return maps.map((e) => Coffee.fromMap(e)).toList();
  }

  Future<int> deleteCoffee(int id) async {
    final dbClient = await db;
    return await dbClient.delete('coffee', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateCoffee(Coffee coffee) async {
    final dbClient = await db;
    return await dbClient.update('coffee', coffee.toMap(), where: 'id = ?', whereArgs: [coffee.id]);
  }
}
