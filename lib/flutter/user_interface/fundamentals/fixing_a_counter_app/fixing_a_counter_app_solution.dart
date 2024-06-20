import 'package:flutter/material.dart';

/**
 * # Solution
 * ## Bug description
 * The counter state is not updated correctly when the increment button is
 * pressed. The value remains 0 even after pressing the increment button
 * multiple times.
 *
 * # Solution
 * To solve the bug, it is necessary to turn the CounterApp widget from
 * StatelessWidget to StatefulWidget, action easily done with the aid of the
 * IDE. [l. 63]
 *
 * Then, it is necessary to fix the `count` variable scope, moving its
 * declaration and initialization from inside the build method to outside,
 * within the [State<CounterApp>] class. [l. 71]
 *
 * Finally, increment the state variable `count` inside the setState callback
 * argument, making it sure that the Flutter engine will be notified to rebuild
 * the interface everytime the `count` is incremented. [l. 78-80]
 */

/**
 * (PT-version)
 * # Solução
 * ## Descrição do bug
 * O estado não é atualizado adequadamente ao pressionar o botão para
 * incrementá-lo. O valor apresentado na tela permanece 0 mesmo após pressionar
 * o botão de incremento várias vezes.
 *
 * # Solução
 * Para resolver o defeito, primeiro, é necessário transformar o widget
 * [CounterApp] de StatelessWidget para StatefulWidget, ação facilmente
 * executada com auxílio da IDE. [l. 63]
 *
 * Depois, deve-se ajustar a variável `count`, que é utilizada para gerenciar o
 * estado do contador. Inicialmente, ela se encontrava no corpo do método
 * build. É importante movê-la para fora, colocando-a como atributo da classe
 * [State<CounterApp>]. [l. 71]
 *
 * Finalmente, deve-se mover o incremento à variável `count` para dentro de uma
 * chamada do método [State<CounterApp>.setState], garantindo que a engine do
 * Flutter será notificada para fazer rebuild toda vez que o estado for
 * atualizado. [l. 78-80]
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
