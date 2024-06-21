import 'package:flutter/material.dart';

/// todo exercise-fundamentals001

/**
 * # Problem (fixing bugs)
 * ## Description
 * Below, there is an incorrect implementation for the Color application.
 * The implementation is not in accordance with the specification below. Your
 * task is to find the bugs and fix them.
 *
 * ## Specification
 * The application consists of a screen with a background color (initially
 * green). There is a text with the name of the current background color and
 * three buttons below with the label of the following colors: Red, Green, and
 * Blue. The button with the selected color is highlighted.
 *
 * For example, if the current color is green and the blue button is pressed,
 * the background color turns into blue and this button becomes highlighted
 * while the previous one goes back to the default color.
 *
 * ## Tasks
 * 1. Find the bugs
 * 2. Fix the implementation
 *
 * ## Useful links
 * - https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html
 * - https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html
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
 * com as seguintes cores: Red (vermelho), Green (verde) e Blue (azul). O botão
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

class ColorWidget extends StatelessWidget {
  ColorWidget({super.key});
  ColorType color = ColorType.blue;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorType.blue.value,
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
          child: Text(color.string),
        ),
      );
}

/******************************************************************************/
/**
 * # Tips
 * 1. Run and test the application
 * 2. Focus on the ColorWidget widget (ColorType and ColorButton are correct)
 * 3. Check the type of the widget
 * 4. Investigate the state variable and its uses. Check the requirements
 */

/**
 * (PT-version)
 * # Dicas
 * 1. Rodar e testar a aplicação
 * 2. Focar no widget ColorWidget (ColorType, ColorButton e MainApp estão
 * corretos)
 * 3. Investigar o tipo de widget
 * 4. Investigar a variável de estado e seus respectivos usos. Comparar com os
 * requisitos
 */
