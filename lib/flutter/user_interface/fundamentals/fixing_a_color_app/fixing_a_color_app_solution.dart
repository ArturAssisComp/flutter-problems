import 'package:flutter/material.dart';

/**
 * # Solution
 * ## Bug description
 * - The initial screen is not green (it is blue instead)
 * - The buttons do not have the correct labels (they are Red, Red, Green
 * instead of Red, Green, Blue
 * - The buttons do not work
 *  - The color does not change when a button is clicked
 *  - The wrong button is highlighted
 *
 *  ## Steps to solve
 *  1. Use the value attribute of the state variable that holds the color
 *  property (color) as argument to the parameter backgroundColor of the
 *  Scaffold of ColorWidget. This will associate the color state to the
 *  background of the scaffold.
 *  2. Change the initial color from ColorType.blue to ColorType.green in the
 *  initialization of the state variable that holds the color property (color).
 *  3. Turn the ColorWidget from StatelessWidget into a StatefulWidget.
 *  4. Fix the button color parameters. They must receive, in order, the
 *  following arguments: color.red, color.green, and color.blue.
 *  5. The red button is almost correct. Wrap the assignment to red color in a
 *  set state. The result is as follows:
 *  ```dart
    ColorButton(
      color: ColorType.red,
      isHighlighted: color == ColorType.red,
      onPressed: () {
        setState(() {
          color = ColorType.red;
        });
      },
    ),
 *  ```
 *  6. Now, the red button is correct. Follow the pattern to the other buttons.
 *  7. To avoid calling rebuild without necessity,  guard each color assignment
 *  with a conditional that checks if the state will not be the same. This could
 *  avoid performance problems if the build process is costly.
 */

/**
 * (PT-version)
 * # Problema (consertando defeitos de código)
 * ## Descrição
 * A seguir temos uma implementação defeituosa de um aplicativo do tipo
 * "Aplicativo de Cor". O aplicativo implementado não está de acordo com a
 * especificação abaixo. Sua tarefa é encontrar os defeitos e consertá-los.
 *
 * ## Especificação do aplicativo
 * O aplicativo consiste em uma página com um fundo de cor inicialmente verde.
 * Há um texto com o nome da atual cor de fundo e, abaixo, três botões rotulados
 * com as seguintes cores: Red (vermelho), Blue (azul) e Green (verde). O botão
 * com a cor selecionada deverá ser destacado dos demais.
 *
 * Como exemplo, se a cor de fundo atual for Green (verde) e o botão com rótulo
 * Blue (azul) é pressionado, a cor de fundo se torna azul e o botão pressionado
 * fica destacado enquanto o botão anterior perde o destaque.
 *
 * ## Atividades
 * 1. Encontrar os defeitos da aplicação
 * 2. Consertar a aplicação
 *
 * ## Links úteis
 * - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
 * - https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
 */
/******************************************************************************/

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
  final String string;
  const ColorType(this.value, this.string);
}

class ColorWidget extends StatefulWidget {
  ColorWidget({super.key});

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {
  ColorType color = ColorType.green;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: color.value,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Background Color: ${color.string}',
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorButton(
                    color: ColorType.red,
                    isHighlighted: color == ColorType.red,
                    onPressed: () {
                      if (color != ColorType.red) {
                        setState(() {
                          color = ColorType.red;
                        });
                      }
                    },
                  ),
                  ColorButton(
                    color: ColorType.green,
                    isHighlighted: color == ColorType.green,
                    onPressed: () {
                      if (color != ColorType.green) {
                        setState(() {
                          color = ColorType.green;
                        });
                      }
                    },
                  ),
                  ColorButton(
                    color: ColorType.blue,
                    isHighlighted: color == ColorType.blue,
                    onPressed: () {
                      if (color != ColorType.blue) {
                        setState(() {
                          color = ColorType.blue;
                        });
                      }
                    },
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
          child: Text(color.string),
        ),
      );
}
