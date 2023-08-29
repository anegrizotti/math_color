import 'package:flutter/material.dart';
import 'package:floodfill_image/floodfill_image.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import 'package:math_color/repositories/levels_repository.dart';

import '../repositories/subject_repository.dart';

class ColorizeImageScreen extends StatefulWidget {
  @override
  _ColorizeImageScreenState createState() => _ColorizeImageScreenState();
}

class _ColorizeImageScreenState extends State<ColorizeImageScreen> {
  Color _selectedColor = Color(0xFFEBA1CB);

  void _openColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione uma cor'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Escolher'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SubjectRepository subjectRepository = SubjectRepository();
    LevelsRepository levelsRepository = LevelsRepository();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              levelsRepository.resetCurrentLevel();
              subjectRepository.resetSubject();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SelectSubjectScreen()),
              );
            },
            color: Color(0xFFFF0000),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xFFFC7EBF2),
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                _openColorPicker(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFB6D993),
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Color(0xFFFB6D993),
                    child: Icon(
                      Icons.brush,
                      size: 60,
                      color: _selectedColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFB6D993),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      'Clique para selecionar uma cor',
                      style: TextStyle(
                        color: Color(0xFFEBA1CE),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bungee',
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            color: Color(0xFF00FFFF),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FloodFillImage(
                imageProvider: AssetImage('lib/assets/imagens/colorImages/sorvete.png'),
                fillColor: _selectedColor,
                avoidColor: [Colors.transparent, Colors.black],
                width: MediaQuery.of(context).size.width.toInt(),
                height: MediaQuery.of(context).size.height.toInt(),
              ),
            ),
          ),
          Container(
            color: Color(0xFFFC7EBF2),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ElevatedButton(
              onPressed: () {
                levelsRepository.resetCurrentLevel();
                subjectRepository.resetSubject();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectSubjectScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFEBA1CE),
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.04),
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                minimumSize: Size(screenWidth, screenHeight * 0.08),
              ),
              child: Text(
                'FINALIZAR PINTURA',
                style: TextStyle(fontSize: screenHeight * 0.05),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
