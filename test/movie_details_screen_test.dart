import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/views/home/movie_details_screen.dart';

void main() {
  group('MovieDetailsScreen Tests', () {
    final fakeMovie = {
      'id': 1,
      'title': 'Lion',
      'poster_path': '/fakepath.jpg',
      'vote_average': 8.5,
      'overview': 'Fake description for a fake movie.',
    };

    testWidgets('Affiche les détails du film', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: MovieDetailsScreen(movie: fakeMovie),
        ),
      );

      // Vérifie la présence d'un widget contenant le titre avec une clé spécifique
      expect(find.byKey(const Key('movieTitleKey')), findsOneWidget);
      expect(find.text('Rating: 8.5'), findsOneWidget);
      expect(find.text('Fake description for a fake movie.'), findsOneWidget);
      print("✅ Informations du film affichées");
    });


    testWidgets('Affiche une image de poster', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          home: MovieDetailsScreen(movie: fakeMovie),
        ),
      );

      // Vérifie la présence d'une image avec le bon tag Hero
      expect(find.byType(Image), findsWidgets);
    });
  });
}
