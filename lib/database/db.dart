import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'questions.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE addition_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE subtraction_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE multiplication_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE division_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE counting_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE time_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE money_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
      )
    ''');
      },
    );
  }

  Future<void> insertQuestions(
      List<Map<String, dynamic>> questions, String tableName) async {
    final db = await database;
    final batch = db.batch();

    for (var question in questions) {
      final optionsJson = jsonEncode(question['options']);
      batch.insert(tableName, {
        'question': question['question'],
        'correctAnswer': question['correctAnswer'],
        'options': optionsJson,
      });
    }

    await batch.commit(noResult: true);
  }
}
