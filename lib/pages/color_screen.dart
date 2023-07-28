import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(ColorScreen());
}

class ColorizeImageScreen extends StatefulWidget {
  @override
  _ColorizeImageScreenState createState() => _ColorizeImageScreenState();
}

class _ColorizeImageScreenState extends State<ColorizeImageScreen> {
  Image? _outlineImage;
  Image? _coloredImage;
  Color _selectedColor = Colors.red;
  List<Offset> _colorPoints = [];

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    _outlineImage = Image.asset('lib/assets/imagens/outline_image.png');
    _coloredImage = Image.asset('lib/assets/imagens/colored_image.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colorize Image'),
      ),
      body: GestureDetector(
        // Mova o GestureDetector para envolver toda a Stack
        behavior: HitTestBehavior.translucent,
        onPanUpdate: (details) {
          final RenderBox box = context.findRenderObject() as RenderBox;
          final localPosition = box.globalToLocal(details.globalPosition);
          setState(() {
            _colorPoints.add(localPosition);
          });
        },
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
                CustomPaint(
                  painter: ColorPointsPainter(
                    colorPoints: _colorPoints,
                    color: _selectedColor,
                  ),
                  child: _outlineImage!,
               ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.color_lens),
              color: _selectedColor,
              onPressed: () {
                _showColorPickerDialog();
              },
            ),
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _colorPoints.clear();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPickerDialog() {
    Color selectedColor =
        _selectedColor; // Cria uma variável para armazenar a cor selecionada

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                selectedColor =
                    color; // Atualiza a cor selecionada conforme o usuário muda a cor no seletor
              },
              showLabel: true, // Exibe a caixa de cor ao lado do seletor
              pickerAreaHeightPercent:
                  0.8, // Define a altura do seletor de cores
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                setState(() {
                  _selectedColor =
                      selectedColor; // Atualiza a cor selecionada na variável de estado
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class ColorPointsPainter extends CustomPainter {
  final List<Offset> colorPoints;
  final Color color;

  ColorPointsPainter({required this.colorPoints, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    if (color.alpha != 0) {
      // Verifica se a cor não é transparente
      for (int i = 0; i < colorPoints.length - 1; i++) {
        canvas.drawLine(colorPoints[i], colorPoints[i + 1], paint);
      }
    }

    // Loop para desenhar os pontos na tela
    for (Offset point in colorPoints) {
      canvas.drawCircle(point, 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorize Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ColorizeImageScreen(),
    );
  }
}
