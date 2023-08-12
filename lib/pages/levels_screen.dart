import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            Navigator.of(context).pop(); // Voltar para a tela anterior
          },
          iconSize: screenWidth * 0.05, // Ajustar o tamanho do ícone
          color: Color(0xFFFB6D993),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              SystemNavigator.pop(); // fechar o aplicativo
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
          SizedBox(height: 30), // Espaço entre a seção e os botões (aumentado em 50%)
          ElevatedButton(
            onPressed: currentLevel >= 1 ? () {
              // Lógica do botão 1
            } : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8), // Cor do botão
              onPrimary: Colors.black,
              shape: CircleBorder(), // Formato redondo
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08), // Ajuste do tamanho
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0), // Ajuste do espaçamento interno
              child: Text(
                '1',
                style: TextStyle(
                  fontSize: 45, // Aumento do tamanho da fonte
                  fontFamily: 'craft', // Aplicando a fonte "CraftGirls"
                  fontWeight: FontWeight.bold, // Fonte em negrito
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035), // Espaço entre os botões (aumentado em 50%)
          ElevatedButton(
            onPressed: () {
              // Lógica do botão 2
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8), // Cor do botão
              onPrimary: Colors.black,
              shape: CircleBorder(), // Formato redondo
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08), // Ajuste do tamanho
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0), // Ajuste do espaçamento interno
              child: Text(
                '2',
                style: TextStyle(
                  fontSize: 45, // Aumento do tamanho da fonte
                  fontFamily: 'craft', // Aplicando a fonte "CraftGirls"
                  fontWeight: FontWeight.bold, // Fonte em negrito
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035), // Espaço entre os botões (aumentado em 50%)
          ElevatedButton(
            onPressed: () {
              // Lógica do botão 3
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8), // Cor do botão
              onPrimary: Colors.black,
              shape: CircleBorder(), // Formato redondo
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08), // Ajuste do tamanho
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0), // Ajuste do espaçamento interno
              child: Text(
                '3',
                style: TextStyle(
                  fontSize: 45, // Aumento do tamanho da fonte
                  fontFamily: 'craft', // Aplicando a fonte "CraftGirls"
                  fontWeight: FontWeight.bold, // Fonte em negrito
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035), // Espaço entre os botões (aumentado em 50%)
          ElevatedButton(
            onPressed: () {
              // Lógica do botão 4
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8), // Cor do botão
              onPrimary: Colors.black,
              shape: CircleBorder(), // Formato redondo
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08), // Ajuste do tamanho
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0), // Ajuste do espaçamento interno
              child: Text(
                '4',
                style: TextStyle(
                  fontSize: 45, // Aumento do tamanho da fonte
                  fontFamily: 'craft', // Aplicando a fonte "CraftGirls"
                  fontWeight: FontWeight.bold, // Fonte em negrito
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.035), // Espaço entre os botões (aumentado em 50%)
          ElevatedButton(
            onPressed: () {
              // Lógica do botão 5
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFE4C0A8), // Cor do botão
              onPrimary: Colors.black,
              shape: CircleBorder(), // Formato redondo
              side: BorderSide(color: Colors.black, width: 2),
              minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08), // Ajuste do tamanho
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0), // Ajuste do espaçamento interno
              child: Text(
                '5',
                style: TextStyle(
                  fontSize: 45, // Aumento do tamanho da fonte
                  fontFamily: 'craft', // Aplicando a fonte "CraftGirls"
                  fontWeight: FontWeight.bold, // Fonte em negrito
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.09), // Espaço entre os botões e o botão "CONCLUIR"
          ElevatedButton(
            onPressed: () {
              // Lógica a ser executada ao pressionar o botão "CONCLUIR"
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFEBA1CE),
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenHeight * 0.04),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              minimumSize: Size(screenWidth * 0.6, screenHeight * 0.08), // Ajuste do tamanho do botão "CONCLUIR"
            ),
            child: Text(
              'CONCLUIR',
              style: TextStyle(fontSize: screenHeight * 0.035), // Ajuste do tamanho da fonte
            ),
          ),
        ],
      ),
    );
  }
}
