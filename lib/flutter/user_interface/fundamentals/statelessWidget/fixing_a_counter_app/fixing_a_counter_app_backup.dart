import 'package:flutter/material.dart';

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
