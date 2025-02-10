import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/app_routes.dart';
import 'package:projet_flutter_find_your_movie/views/home/login_screen.dart';
import 'package:projet_flutter_find_your_movie/views/splash/splash_screen.dart';

import 'mock.dart';

void main() {


  group("login screen test", (){
    setupFirebaseAuthMocks();
    setUpAll(()async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(demoProjectId: "demo-project-id",);
    });

    testWidgets('SplashScreen should navigate to login after 3 seconds', (WidgetTester tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: Routes.splash,
          getPages: AppRouter.pages,
          home: const SplashScreen(),
        ),
      );

      // Vérifie que le logo et le texte sont affichés
      expect(find.text('FindYourMovie'), findsOneWidget);
      expect(find.byIcon(Icons.movie), findsOneWidget);
      print("✅ Logo et texte correctement affichés");
      // Attend 3 secondes
      await tester.pump(const Duration(seconds: 4));
      await tester.pumpAndSettle();
      // Vérifie que l'on est redirigé vers /login
      expect(find.byType(LoginScreen), findsOneWidget);
      print("✅ Redirection vers Login correctement fait");
    });

  });

}
