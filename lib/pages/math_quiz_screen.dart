import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import '../database/db.dart';
import '../repositories/levels_repository.dart';
import '../repositories/subject_repository.dart';
import 'levels_screen.dart';
import 'package:path/path.dart' as path;
import 'package:just_audio/just_audio.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class MathQuizScreen extends StatefulWidget {
  @override
  _MathQuizScreenState createState() => _MathQuizScreenState();
}

class _MathQuizScreenState extends State<MathQuizScreen> {
  Color questionColor = Color(0xFFA0A0A0);
  String questionText = "?";
  bool isAnswerCorrect = false;

  SubjectRepository subjectRepository = SubjectRepository();
  LevelsRepository levelsRepository = LevelsRepository();
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    int currentLevel = levelsRepository.currentLevel;
    String subject = subjectRepository.currentSubject;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFFF),
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildQuestionHeader(screenHeight),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildQuestionRow(
                    screenHeight, screenWidth, currentLevel, subject),
                buildImageIfNeeded(screenHeight, screenWidth),
                buildOptionsRow(
                    screenHeight, screenWidth, currentLevel, subject),
              ],
            ),
          ),
          Spacer(),
          buildNextButton(screenHeight, screenWidth),
        ],
      ),
    );
  }

  void loadSoundEffect(soundEffect) async {
    final sound = await player.setUrl(soundEffect);
    player.play();
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFFFF197),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            PanaraConfirmDialog.show(
              context,
              title: "Deseja desistir?",
              message: '',
              panaraDialogType: PanaraDialogType.warning,
              confirmButtonText: 'Desistir',
              cancelButtonText: 'Cancelar',
              onTapCancel: () => {Navigator.pop(context)},
              onTapConfirm: () => {
                levelsRepository.resetCurrentLevel(),
                subjectRepository.resetSubject(),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectSubjectScreen()),
                ),
              },
            );
          },
          color: Color(0xFFFF0000),
        ),
      ],
    );
  }

  Container buildQuestionHeader(double screenHeight) {
    return Container(
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
    );
  }

  Future<String> getQuestionFromDatabase(int level, String subject) async {
    final dbHelper = DatabaseHelper();
    final tableName = '${subject}_questions';

    final questions = await dbHelper.getQuestions(tableName);
    if (level <= questions.length) {
      return questions[level - 1].question;
    } else {
      return "No question";
    }
  }

  Future<String?> getImageFromDatabase(int level, String subject) async {
    final dbHelper = DatabaseHelper();
    final tableName = '${subject}_questions';

    final questions = await dbHelper.getQuestions(tableName);
    if (level <= questions.length) {
      return questions[level - 1].imageUrl;
    } else {
      return "No question";
    }
  }

  Widget buildQuestionRow(double screenHeight, double screenWidth,
      int currentLevel, String subject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFF197),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.black, width: 2),
            ),
            padding: EdgeInsets.all(35),
            child: FutureBuilder<String>(
              future: getQuestionFromDatabase(currentLevel, subject),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text("Erro ao carregar a pergunta");
                } else {
                  return Text(
                    snapshot.data ?? "No question",
                    style: TextStyle(fontSize: 50),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 5,
                  );
                }
              },
            ),
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
            color: questionColor,
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
    );
  }

  Widget buildImageIfNeeded(double screenHeight, double screenWidth) {
    int currentLevel = levelsRepository.currentLevel;
    String subject = subjectRepository.currentSubject;

    Future<String?> imageFuture = getImageFromDatabase(currentLevel, subject);

    if (imageFuture != null) {
      return FutureBuilder<String?>(
        future: imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Erro ao carregar a imagem");
          } else if (snapshot.data != null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    path.join(
                      'lib',
                      'assets',
                      'imagens',
                      'questionsImages',
                      snapshot.data!,
                    ),
                    width: screenWidth * 0.7,
                    height: screenHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            );
          } else {
            return SizedBox(height: screenHeight * 0.1);
          }
        },
      );
    } else {
      return SizedBox(height: screenHeight * 0.1);
    }
  }

  Future<List<String>> getOptionsFromDatabase(int level, String subject) async {
    final dbHelper = DatabaseHelper();
    final tableName = '${subject}_questions';
    final questions = await dbHelper.getQuestions(tableName);

    if (level <= questions.length) {
      return questions[level - 1].options;
    } else {
      return ["No option"];
    }
  }

  Future<String> getCorrectAnswerFromDatabase(int level, String subject) async {
    final dbHelper = DatabaseHelper();
    final tableName = '${subject}_questions';
    final questions = await dbHelper.getQuestions(tableName);

    if (level <= questions.length) {
      return questions[level - 1].correctAnswer;
    } else {
      return "No option";
    }
  }

  Widget buildOptionButton(
      double screenHeight, double screenWidth, String optionText) {
    return ElevatedButton(
      onPressed: () {
        updateColorQuestionMark(optionText, Color(0xFFC7EBF2));
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFB6D993),
        onPrimary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenHeight * 0.04),
          side: BorderSide(color: Colors.black, width: 2),
        ),
        minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
      ),
      child: Text(
        optionText,
        style: TextStyle(fontSize: screenHeight * 0.05),
      ),
    );
  }

  void updateColorQuestionMark(String optionText, Color optionColor) async {
    int currentLevel = levelsRepository.currentLevel;
    String subject = subjectRepository.currentSubject;

    final correctAnswer =
        await getCorrectAnswerFromDatabase(currentLevel, subject);

    setState(() {
      questionText = optionText;
      questionColor = optionColor;

      if (correctAnswer != "No option" && optionText == correctAnswer) {
        isAnswerCorrect = true;
      } else {
        isAnswerCorrect = false;
      }
    });
  }

  Widget buildOptionsRow(double screenHeight, double screenWidth,
      int currentLevel, String subject) {
    return FutureBuilder<List<String>>(
      future: getOptionsFromDatabase(currentLevel, subject),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Erro ao carregar as opções");
        } else if (snapshot.data != null) {
          List<String> options = snapshot.data!;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: buildOptionButton(screenHeight, screenWidth, options[0]),
              ),
              Expanded(
                flex: 2,
                child: buildOptionButton(screenHeight, screenWidth, options[1]),
              ),
              Expanded(
                flex: 2,
                child: buildOptionButton(screenHeight, screenWidth, options[2]),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget buildNextButton(double screenHeight, double screenWidth) {
    return Container(
      width: screenWidth,
      color: Color(0xFFFC7EBF2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: ElevatedButton(
        onPressed: () {
          loadSoundEffect('asset://lib/lib/assets/soundEffects/proximoSom.mp3');
          if (isAnswerCorrect) {
            levelsRepository.completeLevel();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LevelsScreen()),
            );
          } else {
            loadSoundEffect(
                'asset://lib/lib/assets/soundEffects/respostaErradaSom.mp3');
            PanaraInfoDialog.show(context,
                title: "Resposta errada",
                message: 'Tente novamente!',
                panaraDialogType: PanaraDialogType.error,
                buttonText: 'Ok',
                onTapDismiss: () => {Navigator.pop(context)});
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
    );
  }
}
