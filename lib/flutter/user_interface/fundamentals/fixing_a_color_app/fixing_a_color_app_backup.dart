import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Center(child: ColorWidget()),
      );
}

enum ColorType {
  red(Colors.red, 'Red'),
  green(Colors.green, 'Green'),
  blue(Colors.blue, 'Blue');

  final Color value;
  final String name;
  const ColorType(this.value, this.name);
}

class ColorWidget extends StatelessWidget {
  ColorWidget({super.key});
  var color = ColorType.blue;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorType.blue.value,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Background Color: ${color.name}',
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorButton(
                    color: ColorType.red,
                    isHighlighted: color == ColorType.red,
                    onPressed: () {
                      color = ColorType.red;
                    },
                  ),
                  ColorButton(
                    color: ColorType.red,
                    isHighlighted: true,
                    onPressed: () {},
                  ),
                  ColorButton(
                    color: ColorType.green,
                    isHighlighted: false,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      );
}

class ColorButton extends StatelessWidget {
  const ColorButton({
    required this.color,
    required this.isHighlighted,
    required this.onPressed,
    super.key,
  });
  final ColorType color;
  final bool isHighlighted;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isHighlighted ? Colors.grey : Colors.white,
          ),
          onPressed: onPressed,
          child: Text(color.name),
        ),
      );
}
