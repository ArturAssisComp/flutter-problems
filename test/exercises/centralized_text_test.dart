import 'package:flutter/material.dart';
import 'package:flutter_problems/exercises/stateless_widget/centralized_text/centralized_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exercise: centralized_text', () {
    testWidgets('(50 %) Text should be found', (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: CentralizedText(),
        ),
      ));

      const expectedString = 'Hello World';
      final text = find.text(expectedString);

      expect(text, findsOneWidget, reason: 'text was not found');
    });
    testWidgets('(50 %) Text should be centralized', (tester) async {
      const scaffoldKey = Key('scaffold');
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          body: CentralizedText(),
        ),
      ));

      const expectedString = 'Hello World';
      final text = find.text(expectedString);
      final scaffold = find.byKey(scaffoldKey);

      expect(tester.getCenter(text), tester.getCenter(scaffold),
          reason: 'text not centralized');
    });
  });
}
