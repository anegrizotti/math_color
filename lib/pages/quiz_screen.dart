import 'package:flutter/material.dart';
import '../repositories/levels_repository.dart';
import 'color_screen.dart';
import 'levels_screen.dart';

class MathQuizScreen extends StatefulWidget {
  @override
  _MathQuizScreenState createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Qual é a soma de 2 + 3?',
      'options': ['4', '5', '6', '7'],
      'correctAnswer': '5',
    },
    {
      'question': 'Quanto é 8 dividido por 2?',
      'options': ['2', '4', '6', '8'],
      'correctAnswer': '4',
    },
    // Adicione mais questões aqui
  ];

  List<String> userAnswers = List.filled(10, '');

  void selectAnswer(int questionIndex, String answer) {
    setState(() {
      userAnswers[questionIndex] = answer;
    });
  }

  void submitQuiz() {
    int correctAnswers = 0;
    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] == questions[i]['correctAnswer']) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (correctAnswers == questions.length) {
          LevelsRepository levelsRepository = LevelsRepository();
          levelsRepository.completeLevel(); // Incrementa o nível no LevelRepository
          return AlertDialog(
            title: Text('Resultado do Quiz'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Você acertou todas as questões!'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o diálogo atual
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LevelsScreen()),
                    );
                  },
                  child: Text('Pintar'),
                ),
              ],
            ),
          );
        } else {
          return AlertDialog(
            title: Text('Resultado do Quiz'),
            content: Text('Revise suas respostas.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Fechar'),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math Quiz'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questions[index]['question'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: questions[index]['options'].map<Widget>((option) {
                      return ListTile(
                        title: Text(option),
                        leading: Radio(
                          value: option,
                          groupValue: userAnswers[index],
                          onChanged: (value) {
                            selectAnswer(index, value.toString());
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitQuiz,
        child: Icon(Icons.send),
      ),
    );
  }
}
