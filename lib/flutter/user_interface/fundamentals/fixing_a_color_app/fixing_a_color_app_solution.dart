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
 *  ```dart
    // before
    setState(() {
      color = ColorType.green;
    });

    // after
    if (color != ColorType.green) {
      setState(() {
        color = ColorType.green;
      });
    }
 *  ```
 */

/**
 * (PT-version)
 * # Solução
 * ## Descrição do problema
 * - A tela inicial não é verde (em vez disso, é azul)
 * - Os botões não têm os rótulos corretos (são Vermelho, Vermelho, Verde
 * em vez de Vermelho, Verde, Azul)
 * - Os botões não funcionam
 *  - A cor não muda quando um botão é clicado
 *  - O botão errado é destacado
 *
 * ## Passos para resolver
 *  1. Use o atributo value da variável de estado que mantém a propriedade
 *  de cor (color) como argumento para o parâmetro backgroundColor do
 *  Scaffold do ColorWidget. Isso associará o estado de cor ao fundo do
 *  scaffold.
 *  2. Altere a cor inicial de ColorType.blue para ColorType.green na
 *  inicialização da variável de estado que mantém a propriedade de cor (color).
 *  3. Transforme o ColorWidget de StatelessWidget para um StatefulWidget.
 *  4. Corrija os parâmetros de cor dos botões. Eles devem receber, na ordem,
 *  os seguintes argumentos: color.red, color.green e color.blue.
 *  5. O botão vermelho está quase correto. Insira a atribuição para a cor
 *  vermelha em um setState. O resultado é o seguinte:
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
 *  6. Agora, o botão vermelho está correto. Siga o padrão para os outros
 *  botões.
 *  7. Para evitar chamar build sem necessidade, proteja cada atribuição de
 *  cor com uma condição que verifica se o estado não será o mesmo. Isso pode
 *  evitar problemas de desempenho se o processo de build for custoso.
 *  ```dart
    // antes
    setState(() {
      color = ColorType.green;
    });

    // depois
    if (color != ColorType.green) {
      setState(() {
        color = ColorType.green;
      });
    }
 *  ```
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
