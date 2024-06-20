import 'package:flutter/material.dart';

/**
 * # Solução
 * ## Bug encontrado
 * O estado não é atualizado adequadamente ao pressionar o botão para
 * incrementá-lo.
 *
 * # Solução
 * Para resolver o defeito, primeiro, é necessário transformar o widget
 * [CounterApp] de StatelessWidget para StatefulWidget, ação facilmente
 * executada com auxílio da IDE. [l. 40]
 *
 * Depois, deve-se ajustar a variável `count`, que é utilizada para gerenciar o
 * estado do contador. Inicialmente, ela se encontrava no corpo do método
 * build. É importante movê-la para fora, colocando-a como atributo da classe
 * [State<CounterApp>]. [l. 48]
 *
 * Finalmente, deve-se mover o incremento à variável `count` para dentro de uma
 * chamada do método [State<CounterApp>.setState], garantindo que a engine do
 * Flutter será notificada para fazer rebuild toda vez que o estado for
 * atualizado. [l. 55-57]
 */

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

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current value: $count'),
          ElevatedButton(
            onPressed: () => setState(() {
              count++;
            }),
            child: const Text(kIncrementString),
          ),
        ],
      );
}
