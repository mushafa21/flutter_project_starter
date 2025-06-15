import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entities/game_entity.dart';

class DatabaseHelper {
  // Singleton pattern to ensure only one instance of the database helper exists
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  // Getter for the database instance. Initializes it if it's not already created.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  // Initializes the database
  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'games.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, // This function is called when the database is created for the first time
    );
  }

  // Creates the 'games' table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE games (
        id INTEGER PRIMARY KEY,
        name TEXT,
        backgroundImage TEXT
      )
    ''');
  }

  // --- CRUD Operations ---

  /// Inserts a game into the database.
  Future<int> insertGame(GameEntity game) async {
    final db = await database;
    // `conflictAlgorithm.replace` will update the row if a game with the same id already exists.
    return await db.insert('games', game.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Retrieves all favorited games from the database.
  Future<List<GameEntity>> getGames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('games');

    if (maps.isEmpty) {
      return [];
    }

    return List.generate(maps.length, (i) => GameEntity.fromMap(maps[i]));
  }

  /// Retrieves a single game by its ID to check if it's a favorite.
  Future<GameEntity?> getGameById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'games',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return GameEntity.fromMap(maps.first);
    }
    return null;
  }

  /// Deletes a game from the database by its ID.
  Future<int> deleteGame(int id) async {
    final db = await database;
    return await db.delete(
      'games',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
