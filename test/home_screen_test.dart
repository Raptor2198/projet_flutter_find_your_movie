import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/views/home/home_screen.dart';
void main() {
  group('HomeScreen Tests', () {
    testWidgets('Affiche le titre et l’indicateur de chargement', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(home: HomeScreen()));

      // Vérifie que le titre est affiché
      expect(find.text('Popular Movies'), findsOneWidget);

      // Vérifie la présence de l’indicateur de chargement
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });
}
