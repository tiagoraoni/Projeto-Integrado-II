import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_app/features/trash/widgets/action_button.dart';

void main() {
  group('ActionButton', () {
    testWidgets('Exibe texto corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButton(
              title: 'ABRIR',
              icon: Icons.lock_open,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.text('ABRIR'), findsOneWidget);
    });

    testWidgets('Exibe ícone corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButton(
              title: 'ABRIR',
              icon: Icons.lock_open,
              onPressed: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.lock_open), findsOneWidget);
    });

    testWidgets('Executa callback ao clicar',
        (WidgetTester tester) async {
      bool clicou = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ActionButton(
              title: 'ABRIR',
              icon: Icons.lock_open,
              onPressed: () {
                clicou = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(clicou, true);
    });
  });
}