import 'package:flutter/material.dart';

/// todo exercise0000

/**
 * # Problem (fixing bugs)
 * ## Description
 * Below, there is an incorrect implementation for the Counter application.
 * The implementation is not in accordance with the specification below. Your
 * task is to find the bug and fix it.
 * ## Specification
 * The application consists of a screen with a text and a button bellow it, both
 * centralized. The text presents the current counter value, started from 0, and
 * the button, when pressed, increments the counter.
 * ## Tasks
 * 1. Find the bug
 * 2. Fix the implementation
 * ## Useful links
 * - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
 * - https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
 */

/**
 * (PT-version)
 * # Problema (consertando defeitos de código)
 * ## Descrição
 * A seguir temos uma implementação defeituosa de um aplicativo do tipo
 * "Contador". O aplicativo implementado não está de acordo com a especificação
 * abaixo. Sua tarefa é encontrar o defeito e consertá-lo.
 * ## Especificação do aplicativo
 * O aplicativo consiste em uma página com um texto e um botão logo
 * abaixo, centralizados. O texto apresenta a contagem atual, iniciada do 0, e o
 * botão, ao ser pressionado, deverá incrementar a contagem.
 * ## Atividades
 * 1. Encontrar o defeito da aplicação
 * 2. Consertar a aplicação
 * ## Links úteis
 * - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
 * - https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
 */
/******************************************************************************/

void main() => runApp(const MainApp());

const kIncrementString = 'Increment';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: Scaffold(
          body: Center(child: CounterApp()),
        ),
      );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    var count = 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Current value: $count'),
        ElevatedButton(
          onPressed: () {
            count++;
          },
          child: const Text(kIncrementString),
        ),
      ],
    );
  }
}

/******************************************************************************/
/**
 * # Tips
 * 1. Run and test the application
 * 2. Check the type of the widget
 * 3. Investigate the state variable
 */

/**
 * (PT-version)
 * # Dicas
 * 1. Rodar e testar a aplicação
 * 2. Investigar o tipo de widget
 * 3. Investigar a variável de estado
 */
