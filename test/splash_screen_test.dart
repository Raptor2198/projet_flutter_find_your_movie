import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/views/splash/splash_screen.dart';

void main() {
  testWidgets('Vérifie l\'affichage et la redirection du SplashScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => const SplashScreen()),
          GetPage(name: '/login', page: () => const Scaffold(body: Text('Login Page'))),
        ],
      ),
    );

    // Vérifie que le logo et le texte sont présents
    expect(find.byIcon(Icons.movie), findsOneWidget);
    expect(find.text('FindYourMovie'), findsOneWidget);

    // Attendre la durée du splash screen (3 sec)
    await tester.pump(const Duration(seconds: 3));

    // Vérifie la redirection vers "/login"
    expect(find.text('Login Page'), findsOneWidget);
  });
}
