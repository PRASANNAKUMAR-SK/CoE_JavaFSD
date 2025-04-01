import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'mood_catalog.db');
    return await openDatabase(
      path,
      version: 2,  // Ensure this matches your schema changes
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS mood (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mood TEXT NOT NULL,
        description TEXT,
        date TEXT NOT NULL
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Ensure table creation in case of upgrade
      await db.execute('''
        CREATE TABLE IF NOT EXISTS mood (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          mood TEXT NOT NULL,
          description TEXT,
          date TEXT NOT NULL
        )
      ''');
    }
  }

  // Insert mood entry
  Future<void> insertMood(Map<String, dynamic> mood) async {
    final db = await database;
    await db.insert(
      'mood',
      mood,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Fetch all mood entries sorted by date
  Future<List<Map<String, dynamic>>> getMoods() async {
    final db = await database;
    return await db.query('mood', orderBy: 'date DESC');
  }

  // Delete a mood entry by ID
Future<void> deleteMood(int id) async {
  final db = await database;
  await db.delete('mood', where: 'id = ?', whereArgs: [id]);
}


}
