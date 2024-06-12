import 'package:flutter/material.dart';

/// Autor: Artur Assis Alves
/// Requisitos: criar uma tela com o texto "Hello World" centralizado.
/// Instruções: criar um widget que solucionará o problema, colocando-o como
/// atributo `body` de Scaffold.

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: CentralizedText(),
      ),
    ));

class CentralizedText extends StatelessWidget {
  const CentralizedText({super.key});

  @override
  Widget build(BuildContext context) {
    // Instead of Center, it could be Align( alignment: Alignment(0, 0), ...)
    // or Alignment.center, etc.
    return const Center(
      child: Text('Hello World'),
    );
  }
}
