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
        options TEXT,
        imageUrl TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE subtraction_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE multiplication_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
      )
    ''');

        await db.execute('''
      CREATE TABLE division_questions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        question TEXT,
        correctAnswer TEXT,
        options TEXT,
        imageUrl TEXT
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

        await db.execute('''
      CREATE TABLE images(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
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
        'imageUrl': question['imageUrl'],
        'options': optionsJson,
      });
    }

    await batch.commit(noResult: true);
  }

  Future<void> insertImages(List<String> imageUrls) async {
    final db = await database;
    final batch = db.batch();

    for (var imageUrl in imageUrls) {
      batch.insert('images', {'imageUrl': imageUrl});
    }

    await batch.commit(noResult: true);
  }

  Future<void> resetDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'questions.db');

    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }

    await deleteDatabase(dbPath);

    _database = null;

    await initializeDatabase();
  }

  Future<List<Question>> getQuestions(String tableName) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Question(
        id: maps[i]['id'],
        question: maps[i]['question'],
        imageUrl: maps[i]['imageUrl'],
        correctAnswer: maps[i]['correctAnswer'],
        options: List<String>.from(jsonDecode(maps[i]['options'])),
      );
    });
  }

  Future<List<String>> getImageUrls() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('images');
    return List.generate(maps.length, (i) {
      return maps[i]['imageUrl'];
    });
  }
}

class Question {
  final int id;
  final String question;
  final String correctAnswer;
  final String? imageUrl;
  final List<String> options;

  Question({
    required this.id,
    required this.question,
    required this.correctAnswer,
    this.imageUrl,
    required this.options,
  });
}
