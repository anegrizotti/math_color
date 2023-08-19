import 'package:flutter/material.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import '../models/questions/questions.dart';
import '../repositories/levels_repository.dart';
import '../repositories/subject_repository.dart';
import 'levels_screen.dart';
import 'package:path/path.dart' as path;

class MathQuizScreen extends StatefulWidget {
  @override
  _MathQuizScreenState createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  Color questionColor = Color(0xFFA0A0A0);
  String questionText = "?";
  bool isAnswerCorrect = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Widget sizedBox;

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

    if (questions?[currentLevel - 1]["imageUrl"] != null) {
      sizedBox = SizedBox(height: screenHeight * 0.01);
    } else {
      sizedBox = SizedBox(height: screenHeight * 0.335);
    }

    void updateColorQuestionMark(String optionText, Color optionColor) {
      setState(() {
        questionText = optionText;
        questionColor = optionColor;

        if (optionText == questions?[currentLevel - 1]["correctAnswer"]) {
          isAnswerCorrect = true;
        } else {
          isAnswerCorrect = false;
        }
      });
    }

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Deseja desistir?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Fechar o diálogo
                        },
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          levelsRepository.resetCurrentLevel();
                          subjectRepository.resetSubject();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectSubjectScreen()),
                          );
                        },
                        child: Text("Desistir"),
                      ),
                    ],
                  );
                },
              );
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
                        border: Border.all(color: Colors.black, width: 2),
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
                        color: questionColor, // Altera a cor aqui
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(35),
                      child: Row(
                        children: [
                          Text(
                            questionText,
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (questions?[currentLevel - 1]["imageUrl"] != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          path.join(
                              'lib',
                              'assets',
                              'imagens',
                              'imageQuestions',
                              questions?[currentLevel - 1]["imageUrl"]),
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.3,
                          fit: BoxFit.contain, // Alterado para BoxFit.contain
                        ),
                      ),
                    ],
                  ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        updateColorQuestionMark(
                          '${questions?[currentLevel - 1]["options"][0] ?? "No option"}',
                          Color(0xFFC7EBF2),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB6D993),
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
                        updateColorQuestionMark(
                          '${questions?[currentLevel - 1]["options"][1] ?? "No option"}',
                          Color(0xFFC7EBF2),
                        );
                        // answer logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB6D993),
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
                        updateColorQuestionMark(
                          '${questions?[currentLevel - 1]["options"][2] ?? "No option"}',
                          Color(0xFFC7EBF2),
                        );
                        // answer logic
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFB6D993),
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
                if (isAnswerCorrect) {
                  levelsRepository.completeLevel();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LevelsScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Resposta Errada"),
                        content: Text("Tente novamente!"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
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
