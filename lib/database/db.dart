import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB {
  // Construtor com acesso privado
  DB._();
  // Criar uma instancia de DB
  static final DB instance = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'mathColor.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, versao) async {
    await db.execute(_adicao);
    await db.execute(_subtracao);
    await db.execute(_contagem);
    await db.execute(_dinheiro);
    await db.execute(_tempo);
    await db.execute(_multiplicacao);
    await db.execute(_divisao);
   // await db.insert('conta', {'saldo': 0}); Perguntar para o Robson
  }

  String get _adicao => '''
    CREATE TABLE adicao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _subtracao => '''
    CREATE TABLE subtracao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _contagem => '''
    CREATE TABLE contagem (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _dinheiro => '''
    CREATE TABLE dinheiro (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _tempo => '''
    CREATE TABLE tempo (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _multiplicacao => '''
    CREATE TABLE multiplicacao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';

  String get _divisao => '''
    CREATE TABLE divisao (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      caminhoImagem TEXT
    );
  ''';
}