import 'package:flutter/material.dart';
import 'package:flutter_problems/flutter/user_interface/fundamentals/fixing_a_color_app/fixing_a_color_app.dart';
import 'package:flutter_problems/flutter/user_interface/fundamentals/fixing_a_color_app/fixing_a_color_app_solution.dart'
    as solution;
import 'package:flutter_test/flutter_test.dart';

//const kUseSolution = true;
const kUseSolution = false;

void main() {
  testWidgets('Check color widget', (tester) async {
    await tester
        .pumpWidget(kUseSolution ? const solution.MainApp() : const MainApp());

    // ignore: omit_local_variable_types
    final scaffold = find.byType(Scaffold);

    final redString = ColorType.red.string;
    final greenString = ColorType.green.string;
    final blueString = ColorType.blue.string;
    final redColor = ColorType.red.value;
    final greenColor = ColorType.green.value;
    final blueColor = ColorType.blue.value;

    expect(find.textContaining(redString), findsOneWidget);
    expect(find.textContaining(greenString), findsExactly(2));
    expect(find.textContaining(blueString), findsOneWidget);
    expect(
      tester.widget<Scaffold>(scaffold).backgroundColor,
      equals(greenColor),
    );

    final redButton = find.text(redString);
    final greenButton = find.text(greenString);
    final blueButton = find.text(blueString);

    await tester.tap(redButton);
    await tester.pump();
    expect(find.textContaining(redString), findsExactly(2));
    expect(find.textContaining(greenString), findsOneWidget);
    expect(find.textContaining(blueString), findsOneWidget);
    expect(tester.widget<Scaffold>(scaffold).backgroundColor, equals(redColor));

    await tester.tap(redButton);
    await tester.pump();

    expect(find.textContaining(redString), findsExactly(2));
    expect(find.textContaining(greenString), findsOneWidget);
    expect(find.textContaining(blueString), findsOneWidget);
    expect(tester.widget<Scaffold>(scaffold).backgroundColor, equals(redColor));

    await tester.tap(blueButton);
    await tester.pump();
    expect(find.textContaining(redString), findsOneWidget);
    expect(find.textContaining(greenString), findsOneWidget);
    expect(find.textContaining(blueString), findsExactly(2));
    expect(
        tester.widget<Scaffold>(scaffold).backgroundColor, equals(blueColor));

    await tester.tap(greenButton);
    await tester.pump();
    expect(find.textContaining(redString), findsOneWidget);
    expect(find.textContaining(greenString), findsExactly(2));
    expect(find.textContaining(blueString), findsOneWidget);
    expect(
      tester.widget<Scaffold>(scaffold).backgroundColor,
      equals(greenColor),
    );
  });
}
