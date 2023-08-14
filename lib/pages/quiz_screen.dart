import 'package:flutter/material.dart';
import 'package:math_color/pages/select_subject_screen.dart';

class MathQuizScreen extends StatelessWidget {
  const MathQuizScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFD8DADA),
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
          Spacer(), // Fill remaining space
          Container(
            color: Color(0xFF0080FF), // Blue container background
            width: screenWidth,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectSubjectScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No rounded corners
                  side: BorderSide(color: Colors.black, width: 2),
                ),
                minimumSize: Size(
                    screenWidth, screenHeight * 0.08), // Ajuste do tamanho do botão "PRÓXIMO"
              ),
              child: Text(
                'PRÓXIMO',
                style: TextStyle(
                    fontSize:
                        screenHeight * 0.035), // Ajuste do tamanho da fonte
              ),
            ),
          ),
        ],
      ),
    );
  }
}
