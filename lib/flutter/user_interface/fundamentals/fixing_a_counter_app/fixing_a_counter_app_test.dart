import 'package:flutter_problems/flutter/user_interface/fundamentals/fixing_a_counter_app/fixing_a_counter_app.dart';
import 'package:flutter_problems/flutter/user_interface/fundamentals/fixing_a_counter_app/fixing_a_counter_app_solution.dart'
    as solution;
import 'package:flutter_test/flutter_test.dart';

//const kUseSolution = true;
const kUseSolution = false;

void main() {
  testWidgets('Check counter', (tester) async {
    await tester
        .pumpWidget(kUseSolution ? const solution.MainApp() : const MainApp());

    expect(find.textContaining('0'), findsOneWidget);

    final incrementButton = find.text(kIncrementString);
    await tester.tap(incrementButton);
    await tester.pump();
    expect(find.textContaining('1'), findsOneWidget);
    await tester.tap(incrementButton);
    await tester.pump();
    expect(find.textContaining('2'), findsOneWidget);
    await tester.tap(incrementButton);
    await tester.pump();
    expect(find.textContaining('3'), findsOneWidget);
  });
}
