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

    _database = null;
  }

  Future<Database> _openDatabase() async {
    final databasesPath = await getDatabasesPath();
    final databasePath = join(databasesPath, databaseName);

    return openDatabase(
      databasePath,
      version: databaseVersion,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE habit (
            id TEXT PRIMARY KEY,
            habitTitle TEXT NOT NULL,
            habitDescription TEXT,
            habitColor INTEGER NOT NULL,
            habitIcon INTEGER NOT NULL
          )
        ''');

        await database.execute('''
          CREATE TABLE habitDetails (
            id TEXT PRIMARY KEY,
            habitId TEXT NOT NULL,
            habitFrequencyType INTEGER NOT NULL,
              
            UNIQUE(habitId),

            FOREIGN KEY (habitId)
            REFERENCES habit(id)
            ON DELETE CASCADE
          )
        ''');

        await database.execute('''
          CREATE TABLE habitDays(
            id TEXT PRIMARY KEY,
            habitDetailsId TEXT NOT NULL,
            habitFrequencyDay INTEGER NOT NULL,

            UNIQUE(habitDetailsId, habitFrequencyDay),

            FOREIGN KEY (habitDetailsId)
            REFERENCES habitDetails(id)
            ON DELETE CASCADE
          )

        ''');
      },
      onUpgrade: (database, oldVersion, newVersion) async {},
    );
  }
}
