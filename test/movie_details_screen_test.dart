import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/views/home/movie_details_screen.dart';

void main() {
  testWidgets('Affichage des détails du film', (WidgetTester tester) async {
    final fakeMovie = {
      'id': 1,
      'title': 'Fake Movie',
      'poster_path': '/fake.jpg',
      'vote_average': 8.0,
      'overview': 'This is a fake movie description'
    };

    await tester.pumpWidget(
      GetMaterialApp(
        home: MovieDetailsScreen(movie: fakeMovie),
      ),
    );

    // Vérifier l'affichage du titre
    expect(find.text('Fake Movie'), findsOneWidget);

    // Vérifier l'affichage de la note
    expect(find.text('Rating: 8.0'), findsOneWidget);

    // Vérifier l'affichage de la description
    expect(find.text('This is a fake movie description'), findsOneWidget);
  });
}
