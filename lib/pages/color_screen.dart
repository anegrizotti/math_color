import 'dart:math';
import 'package:flutter/material.dart';
import 'package:floodfill_image/floodfill_image.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import 'package:math_color/repositories/levels_repository.dart';
import '../database/db.dart';
import '../repositories/subject_repository.dart';

class ColorizeImageScreen extends StatefulWidget {
  @override
  _ColorizeImageScreenState createState() => _ColorizeImageScreenState();
}

class _ColorizeImageScreenState extends State<ColorizeImageScreen> {
  Color _selectedColor = Colors.yellow;
  String randomImageUrl = '';

  List<Color> predefinedColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.black,
    Color.fromARGB(255, 255, 162, 56),
    Color(0xFFA4A4A4),
    Color(0xFF61210B),
    Color.fromARGB(255, 255, 211, 222),
    Color.fromARGB(255, 213, 90, 238),
    Color.fromARGB(255, 146, 212, 255),
  ];

  @override
  void initState() {
    super.initState();
    loadRandomImageUrl();
  }

  Future<void> loadRandomImageUrl() async {
    final databaseHelper = DatabaseHelper();
    final imageUrls = await databaseHelper.getImageUrls();
    final random = Random();
    final randomIndex = random.nextInt(imageUrls.length);
    setState(() {
      randomImageUrl = imageUrls[randomIndex];
    });
  }

  void openColorPicker(BuildContext context) {
  final List<Color> topColors = predefinedColors.sublist(0, 8);
  final List<Color> bottomColors = predefinedColors.sublist(8);

  final double circlePadding = 8.0; // Espaçamento entre os círculos

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Selecione uma cor'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: topColors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                        Navigator.of(context).pop();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(circlePadding),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: bottomColors.map((color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                        Navigator.of(context).pop();
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(circlePadding),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20.0,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: resetAndNavigateToSubjectScreen,
            color: Color(0xFFFF0000),
          ),
        ],
      ),
      body: Column(
        children: [
          buildColorSelectionButton(),
          Expanded(
            child: Center(
              child: buildFloodFillImage(),
            ),
          ),
          buildFinishPaintButton(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget buildColorSelectionButton() {
    return Container(
      color: Color(0xFFFFF197),
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          openColorPicker(context);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFB6D993)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.black, width: 2),
            ),
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
                      blurRadius: 0.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFloodFillImage() {
    return Center(
      child: randomImageUrl.isNotEmpty
          ? FloodFillImage(
              imageProvider:
                  AssetImage('lib/assets/imagens/colorImages/$randomImageUrl'),
              fillColor: _selectedColor,
              avoidColor: [Colors.transparent, Colors.black],
              width: MediaQuery.of(context).size.width.toInt(),
              height: MediaQuery.of(context).size.height.toInt(),
            )
          : CircularProgressIndicator(),
    );
  }

  Widget buildFinishPaintButton(double screenHeight, double screenWidth) {
    return Container(
      color: Color(0xFFFC7EBF2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ElevatedButton(
        onPressed: resetAndNavigateToSubjectScreen,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFEBA1CE)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenHeight * 0.04),
              side: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width, screenHeight * 0.08),
          ),
        ),
        child: Text(
          'FINALIZAR PINTURA',
          style: TextStyle(fontSize: screenHeight * 0.05),
        ),
      ),
    );
  }

  void resetAndNavigateToSubjectScreen() {
    final levelsRepository = LevelsRepository();
    final subjectRepository = SubjectRepository();
    levelsRepository.resetCurrentLevel();
    subjectRepository.resetSubject();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectSubjectScreen()),
    );
  }
}
