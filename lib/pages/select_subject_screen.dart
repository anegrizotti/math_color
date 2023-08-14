import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_color/pages/levels_screen.dart';
import 'package:math_color/pages/quiz_screen.dart';
import 'package:path/path.dart' as path;

import '../repositories/subject_repository.dart';
import 'color_screen.dart';

class SelectSubjectScreen extends StatelessWidget {
  const SelectSubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    SubjectRepository subjectRepository = SubjectRepository();

    return Scaffold(
      backgroundColor: Color(0xFFFF1F5F4),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Voltar para a tela anterior
          },
          iconSize: screenWidth * 0.05,
          color: Color(0xFFFB6D993),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              SystemNavigator.pop(); // fechar o aplicativo
            },
            iconSize: screenWidth * 0.05,
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
                        'MATH',
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
                      Text(
                        'COLOR',
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
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(70),
            child: Text(
              'SELECIONE UM ASSUNTO: ',
              style: TextStyle(
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: TextButton.icon(
              onPressed: () {
                subjectRepository.updateSubject('contagem');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathQuizScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Colors.black, width: 2),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenHeight * 0.04),
                  ),
                ),
              ),
              icon: Image.asset(
                path.join('lib', 'assets', 'imagens', 'Contagem.png'),
                width: screenHeight * 0.5,
                height: screenWidth * 0.1,
              ),
              label: Text(
                '',
                style: TextStyle(
                  color: Color(0xFFFB6D993),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'craft',
                  fontSize: screenHeight * 0.01,
                  decoration: TextDecoration.overline,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('adicao');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectSubjectScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join('lib', 'assets', 'imagens', 'adicao.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('subtracao');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LevelsScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join('lib', 'assets', 'imagens', 'subtracao.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('multiplicacao');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectSubjectScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join(
                          'lib', 'assets', 'imagens', 'multiplicacao.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('divisao');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectSubjectScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join('lib', 'assets', 'imagens', 'divisao.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('tempo');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectSubjectScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join('lib', 'assets', 'imagens', 'tempo.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: () {
                      subjectRepository.updateSubject('dinheiro');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectSubjectScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFFC7EBF2)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Colors.black, width: 2),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                      ),
                    ),
                    icon: Image.asset(
                      path.join('lib', 'assets', 'imagens', 'dinheiro.png'),
                      width: screenHeight * 0.235,
                      height: screenWidth * 0.1,
                    ),
                    label: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFFB6D993),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'craft',
                        fontSize: screenHeight * 0.01,
                        decoration: TextDecoration.overline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
