import 'package:flutter/material.dart';

/// todo exercise0000

/**
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
 * # Dicas
 * 1. Rodar e testar a aplicação
 * 2. Investigar o tipo de widget
 * 3. Investigar a variável de estado
 */
