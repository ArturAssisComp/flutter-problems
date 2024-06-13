import 'package:flutter/material.dart';

/// Autor: Artur Assis Alves
/// Requisitos: criar uma tela com o texto "Hello World" centralizado.
/// Instruções: implementar a solução em CentralizedText.

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: CentralizedText(),
      ),
    ));

class CentralizedText extends StatelessWidget {
  const CentralizedText({super.key});

  @override
  Widget build(BuildContext context) {
    // Substituir Placeholder por sua implementação.
    return const Placeholder();
  }
}
