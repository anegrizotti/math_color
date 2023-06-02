import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AwardScreen extends StatelessWidget {
  const AwardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
        body: Column(children: [
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
                        'PRÊMIOS',
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
          )
        ]),
      );
  }
}
