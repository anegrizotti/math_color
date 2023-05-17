import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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