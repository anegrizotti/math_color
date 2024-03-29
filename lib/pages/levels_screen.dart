import 'package:flutter/material.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:math_color/pages/color_screen.dart';
import 'package:math_color/pages/math_quiz_screen.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import 'package:math_color/repositories/subject_repository.dart';
import 'package:math_color/repositories/levels_repository.dart';
import 'package:just_audio/just_audio.dart';

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

    void loadSoundEffect(soundEffect) async {
      try {
        final sound = await player.setUrl(soundEffect);
        player.play();
      } catch (e) {
        return;
      }
    }

    Widget buildLevelButton(int level) {
      return ElevatedButton(
        onPressed: currentLevel == level
            ? () {
                loadSoundEffect(
                    'asset://lib/lib/assets/soundEffects/levelsSom.mp3');
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFFFF197), // Torna a AppBar transparente
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                loadSoundEffect(
                    'asset://lib/lib/assets/soundEffects/desistirSom.mp3');
                showDialog(
                    context: context,
                    builder: (_) => AssetGiffDialog(
                          image: Image.asset(
                            path.join('lib', 'assets', 'gifs', 'thinking.gif'),
                          ),
                          title: Text(
                            'Deseja desistir?',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onOkButtonPressed: () {
                            levelsRepository.resetCurrentLevel();
                            subjectRepository.resetSubject();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectSubjectScreen(),
                              ),
                            );
                          },
                          entryAnimation: EntryAnimation.bottomRight,
                          buttonOkColor: Color(0xFFEBA1CE),
                          cornerRadius: 8.0,
                          buttonRadius: 8.0,
                          buttonOkText: const Text(
                            'Sim',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          buttonCancelText: Text(
                            'Cancelar',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ));
              },
              iconSize: screenWidth * 0.05,
              color: Color(0xFFFF0000),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage('lib/assets/imagens/pagesImages/telaCaminho.png'),
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
