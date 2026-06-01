import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/app.dart';

void main() {
  group('SmartTrashApp', () {
    testWidgets('Aplicação carrega corretamente',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SmartTrashApp());

      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('HomePage é exibida ao iniciar o app',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SmartTrashApp());

      expect(find.text('Lixeira Inteligente'), findsOneWidget);
    });
  });
}