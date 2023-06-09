import 'package:flutter/material.dart';
import 'package:math_color/pages/select_subject_screen.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Color',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
          final double screenHeight = MediaQuery.of(context).size.height;
          final double screenWidth = MediaQuery.of(context).size.width;

          return Scaffold(
            backgroundColor: Color(0xFFFFF197),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'MATH',
                            style: TextStyle(
                              color: Color(0xFFEBA1CE),
                              fontSize: screenHeight * 0.1,
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
                              fontSize: screenHeight * 0.1,
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
                    Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.06),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectSubjectScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFB6D993),
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.04),
                            side: BorderSide(color: Colors.black, width: 2),
                          ),
                          minimumSize:
                              Size(screenWidth * 0.5, screenHeight * 0.08),
                        ),
                        child: Text('INICIAR',
                            style: TextStyle(fontSize: screenHeight * 0.05)),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Expanded(
                      child: Image.asset(
                        path.join('lib', 'assets', 'imagens','telainicial.png'),
                        fit: BoxFit.contain,
                        height: screenHeight * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
