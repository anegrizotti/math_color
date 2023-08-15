import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_color/pages/color_screen.dart';
import 'package:math_color/pages/math_quiz_screen.dart';

import '../repositories/levels_repository.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    LevelsRepository levelsRepository = LevelsRepository();
    int currentLevel = levelsRepository.currentLevel;

    return Scaffold(
      backgroundColor: Color(0xFFB6D993),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: screenWidth * 0.05, // Ajustar o tamanho do ícone
          color: Color(0xFFFB6D993),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              SystemNavigator.pop();
            },
            iconSize: screenWidth * 0.05, // Ajustar o tamanho do ícone
            color: Color(0xFFFF0000),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.15,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFFF197),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'FASES',
                        style: TextStyle(
                          color: Color(0xFFEBA1CE),
                          fontSize: screenHeight * 0.05,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: currentLevel == 1
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MathQuizScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8),
              onPrimary: Colors.black,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'craft',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          ElevatedButton(
            onPressed: currentLevel == 2
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MathQuizScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8),
              onPrimary: Colors.black,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '2',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'craft',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          ElevatedButton(
            onPressed: currentLevel == 3
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MathQuizScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8),
              onPrimary: Colors.black,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '3',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'craft',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          ElevatedButton(
            onPressed: currentLevel == 4
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MathQuizScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8),
              onPrimary: Colors.black,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '4',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'craft',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035),
          ElevatedButton(
            onPressed: currentLevel == 5
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MathQuizScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8),
              onPrimary: Colors.black,
              shape: CircleBorder(),
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                '5',
                style: TextStyle(
                  fontSize: 45,
                  fontFamily: 'craft',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
          ElevatedButton(
            onPressed: currentLevel == 6
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColorizeImageScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFEBA1CE),
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenHeight * 0.04),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              minimumSize: Size(screenWidth * 0.6, screenHeight * 0.08),
            ),
            child: Text(
              'CONCLUIR',
              style: TextStyle(fontSize: screenHeight * 0.035),
            ),
          ),
        ],
      ),
    );
  }
}
