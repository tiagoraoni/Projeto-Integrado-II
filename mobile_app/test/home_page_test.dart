import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_app/features/trash/pages/home_page.dart';
import 'package:mobile_app/features/trash/pages/settings_page.dart';

void main() {
  group('HomePage', () {
    testWidgets('Exibe título da tela',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text('Lixeira Inteligente'), findsOneWidget);
    });

    testWidgets('Exibe status ONLINE',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text('ONLINE'), findsOneWidget);
    });

    testWidgets('Exibe status FECHADA',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text('FECHADA'), findsOneWidget);
    });

    testWidgets('Exibe os botões principais',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      expect(find.text('ABRIR LIXEIRA'), findsOneWidget);
      expect(find.text('FECHAR LIXEIRA'), findsOneWidget);
      expect(find.text('CONFIGURAÇÕES'), findsOneWidget);
    });

    testWidgets('Navega para tela de configurações',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );

      await tester.tap(find.text('CONFIGURAÇÕES'));
      await tester.pumpAndSettle();

      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.text('Tela de Configurações'), findsOneWidget);
    });
  });
}