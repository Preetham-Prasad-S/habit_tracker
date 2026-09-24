import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static const String databaseName = 'schedule_tracker.db';
  static const int databaseVersion = 1;

  Future<Database>? _database;

  Future<Database> get database => _database ??= _openDatabase();

  Future<void> initialize() async {
    await database;
  }

  Future<void> deleteAppDatabase() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, databaseName);

    await deleteDatabase(databasePath);
  }

  Future<Database> _openDatabase() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, databaseName);

    return openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE habit (
            id TEXT PRIMARY KEY,
            habitTitle TEXT NOT NULL,
            habitSubTitle TEXT
          )
        ''');
      },
      onUpgrade: (database, oldVersion, newVersion) async {},
    );
  }
}
