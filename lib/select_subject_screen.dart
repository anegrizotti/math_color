import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class SelectSubjectScreen extends StatelessWidget {
  const SelectSubjectScreen({Key? key}) : super(key: key);

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
          iconSize: 30, // Ajustar o tamanho do ícone
          color: Color(0xFFFB6D993),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.15,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFFFF197),
            child: Center(
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
          ),
          Container(
            alignment: Alignment.centerLeft,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectSubjectScreen()),
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
                width: screenHeight * 0.5, // Largura desejada da imagem
                height: screenWidth * 0.1, // Altura desejada da imagem
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
            child: Row(children: [
              TextButton.icon(
                onPressed: () {
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
                      borderRadius: BorderRadius.circular(screenHeight * 0.03),
                    ),
                  ),
                ),
                icon: Image.asset(
                  path.join('lib', 'assets', 'imagens', 'adicao.png'),
                  width: screenHeight * 0.19, // Largura desejada da imagem
                  height: screenWidth * 0.1, // Altura desejada da imagem
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
                      borderRadius: BorderRadius.circular(screenHeight * 0.03),
                    ),
                  ),
                ),
                icon: Image.asset(
                  path.join('lib', 'assets', 'imagens', 'subtracao.png'),
                  width: screenHeight * 0.19, // Largura desejada da imagem
                  height: screenWidth * 0.1, // Altura desejada da imagem
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
            ]),
          ),
          // Add other widgets here...
        ],
      ),
    );
  }
}
