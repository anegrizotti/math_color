import 'package:flutter/material.dart';
import 'package:math_color/select_subject_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  runApp(MyApp());
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
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Color(0xFFFFF197),
          body: Center(
            child: Column(
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
                      MaterialPageRoute(builder: (context) => SelectSubjectScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB6D993),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('INICIAR', style: TextStyle(fontSize: 30)),
                ),

                SizedBox(height: 50),
                Image.asset(
                  path.join('lib', 'assets', 'telainicial.png'),
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}