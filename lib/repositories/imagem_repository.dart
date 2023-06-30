
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

import '../database/db.dart';
import '../models/Imagem.dart';

class ImagemRepository extends ChangeNotifier {
  late Database db;
  List<Imagem> _imagens = [];

  List<Imagem> get imagem => _imagens;

  ImagemRepository() {
    _initRepository();
  }

  _initRepository() async {
    await _getImagem();
  }

  _getImagem() async {
    db = await DB.instance.database;
    List imagem = await db.query('imagem', limit: 1);
    _imagens = imagem.first['imagem'];
    notifyListeners();
  }
}