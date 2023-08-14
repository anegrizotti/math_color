import 'package:flutter/material.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import '../models/questions/questions.dart';
import '../repositories/levels_repository.dart';
import '../repositories/subject_repository.dart';
import 'levels_screen.dart';

class MathQuizScreen extends StatelessWidget {
  const MathQuizScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    SubjectRepository subjectRepository = SubjectRepository();
    LevelsRepository levelsRepository = LevelsRepository();
    
    int currentLevel = levelsRepository.currentLevel;
    String subject = subjectRepository.currentSubject;
    List<Map<String, dynamic>>? questions;

    if (subject == 'adicao') {
      questions = additionQuestions;
    } else if (subject == 'subtracao') {
      questions = subtractionQuestions;
    } else if (subject == 'multiplicacao') {
      questions = multiplicationQuestions;
    } else if (subject == 'divisao') {
      questions = divisionQuestions;
    } else if (subject == 'contagem') {
      questions = countingQuestions;
    } else if (subject == 'tempo') {
      questions = timeQuestions;
    } else if (subject == 'dinheiro') {
      questions = moneyQuestions;
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Voltar para a tela anterior
          },
          color: Color(0xFFFB6D993),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop(); // Fechar a tela
            },
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
                        'QUESTÃO',
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
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF197),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(35),
                      child: Row(
                        children: [
                          Text(
                            '${questions?[currentLevel - 1]["question"] ?? "No question"}',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(35),
                      child: Row(
                        children: [
                          Text(
                            '=',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFA0A0A0),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(35),
                      child: Row(
                        children: [
                          Text(
                            '?',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.335),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Correct answer logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEBA1CE),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        minimumSize:
                            Size(screenWidth * 0.3, screenHeight * 0.08),
                      ),
                      child: Text(
                        '${questions?[currentLevel - 1]["options"][0] ?? "No option"}',
                        style: TextStyle(fontSize: screenHeight * 0.05),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Incorrect answer logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEBA1CE),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        minimumSize:
                            Size(screenWidth * 0.3, screenHeight * 0.08),
                      ),
                      child: Text(
                        '${questions?[currentLevel - 1]["options"][1] ?? "No option"}',
                        style: TextStyle(fontSize: screenHeight * 0.05),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Incorrect answer logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEBA1CE),
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                          side: BorderSide(color: Colors.black, width: 2),
                        ),
                        minimumSize:
                            Size(screenWidth * 0.3, screenHeight * 0.08),
                      ),
                      child: Text(
                        '${questions?[currentLevel - 1]["options"][2] ?? "No option"}',
                        style: TextStyle(fontSize: screenHeight * 0.05),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.09),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: screenWidth,
            color: Color(0xFFFC7EBF2),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LevelsScreen()),
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
                'PRÓXIMO',
                style: TextStyle(fontSize: screenHeight * 0.035),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
