import 'package:flutter/material.dart';
import 'package:math_color/pages/color_screen.dart';
import 'package:math_color/pages/math_quiz_screen.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import 'package:math_color/repositories/subject_repository.dart';
import 'package:math_color/repositories/levels_repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    LevelsRepository levelsRepository = LevelsRepository();
    SubjectRepository subjectRepository = SubjectRepository();
    final player = AudioPlayer();

    int currentLevel = levelsRepository.currentLevel;

    Widget buildLevelButton(int level) {
      return ElevatedButton(
        onPressed: currentLevel == level
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathQuizScreen()),
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFE4C0A8),
          onPrimary: Colors.black,
          shape: CircleBorder(),
          side: BorderSide(color: Colors.black, width: 2),
          minimumSize: Size(screenWidth * 0.3, screenHeight * 0.08),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            level.toString(),
            style: TextStyle(
              fontSize: 45,
              fontFamily: 'craft',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    void loadSoundEffect(soundEffect) async {
      final sound = await player.setUrl(soundEffect);
      player.play();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF197), // Torna a AppBar transparente
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
            iconSize: screenWidth * 0.05,
            color: Color(0xFFFF0000),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/imagens/pagesImages/telaCaminho.png'),
            fit: BoxFit.cover,
          ),
        ),
      child: Column(
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
          SizedBox(height: screenHeight * 0.01),
          // Cria botões de nível de forma personalizada
          Container(
            height: screenHeight * 0.65,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.25,
                  child: buildLevelButton(1),
                ),
                Positioned(
                  top: screenHeight * 0.15,
                  right: screenWidth * 0.15,
                  child: buildLevelButton(2),
                ),
                Positioned(
                  top: screenHeight * 0.29,
                  left: screenWidth * 0.18,
                  child: buildLevelButton(3),
                ),
                Positioned(
                  top: screenHeight * 0.37,
                  left: screenWidth * 0.59,
                  child: buildLevelButton(4),
                ),
                Positioned(
                  top: screenHeight * 0.55,
                  child: buildLevelButton(5),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          ElevatedButton(
            onPressed: currentLevel == 6
                ? () {
                    loadSoundEffect(
                        'asset://lib/lib/assets/soundEffects/concluidoSom.mp3');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColorizeImageScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFEBA1CE),
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenHeight * 0.04),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              minimumSize: Size(screenWidth * 0.6, screenHeight * 0.08),
            ),
            child: Text(
              'CONCLUIR',
              style: TextStyle(fontSize: screenHeight * 0.035),
            ),
          ),
        ],
      ),
    ));
  }
}
