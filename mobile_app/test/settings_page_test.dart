import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_app/features/trash/pages/settings_page.dart';

void main() {
  group('SettingsPage', () {
    testWidgets('Exibe título da AppBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsPage(),
        ),
      );

      expect(find.text('Configurações'), findsOneWidget);
    });

    testWidgets('Exibe texto principal',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsPage(),
        ),
      );

      expect(find.text('Tela de Configurações'), findsOneWidget);
    });

    testWidgets('Possui Scaffold carregado',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SettingsPage(),
        ),
      );

      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}