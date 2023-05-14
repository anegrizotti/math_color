import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFFFF197),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'MATH',
                  style: TextStyle(
                    color: Color(0xFFEBA1CE),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color(0xFFC7EBF2),
                      ),
                    ],
                  ),
                ),
                Text(
                  'COLOR',
                  style: TextStyle(
                    color: Color(0xFFEBA1CE),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Color(0xFFC7EBF2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectSubjectScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFB6D993), // sets the background color
                onPrimary: Colors.black, // sets the text color
              ),
              child: const Text('Iniciar', style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 50),
            Image.asset(
              'assets/telainicial.png', // o caminho da imagem dentro do diretório lib
              width: 200, // ajusta a largura da imagem
            ),
          ],
        ),
      ),
    );
  }
}

class SelectSubjectScreen extends StatelessWidget {
  const SelectSubjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione um assunto'),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 4'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 5'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 6'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Botão 7'),
          ),
        ],
      ),
    );
  }
}
