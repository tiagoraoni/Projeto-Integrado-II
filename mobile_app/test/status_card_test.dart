import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobile_app/features/trash/widgets/status_card.dart';

void main() {
  group('StatusCard', () {
    testWidgets('Exibe título corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusCard(
              title: 'ONLINE',
              icon: Icons.wifi,
              color: Colors.green,
            ),
          ),
        ),
      );

      expect(find.text('ONLINE'), findsOneWidget);
    });

    testWidgets('Exibe ícone corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusCard(
              title: 'ONLINE',
              icon: Icons.wifi,
              color: Colors.green,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.wifi), findsOneWidget);
    });

    testWidgets('Renderiza um Card',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: StatusCard(
              title: 'ONLINE',
              icon: Icons.wifi,
              color: Colors.green,
            ),
          ),
        ),
      );

      expect(find.byType(Card), findsOneWidget);
    });
  });
}