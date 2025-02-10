import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:projet_flutter_find_your_movie/app_routes.dart';
import 'package:projet_flutter_find_your_movie/controllers/auth_controller.dart';
import 'package:projet_flutter_find_your_movie/views/home/login_screen.dart';
import 'package:projet_flutter_find_your_movie/views/home/home_screen.dart';

import 'mock.dart';

// Simule un utilisateur Firebase minimal
class FakeUser extends Fake implements User {
  @override
  String get uid => '12345';
}

// Simule un AuthController qui renvoie toujours un FakeUser lors du login
class FakeAuthController extends AuthController {
  @override
  Future<User?> login(String email, String password) async {
    // Simule un login réussi
    return FakeUser();
  }
}

void main() {
  group("login screen test", (){
    setupFirebaseAuthMocks();
    setUpAll(()async{
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(demoProjectId: "demo-project-id",);
    });

    testWidgets('Login screen affiche les champs et boutons', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(home: LoginScreen()));

      // Vérifier la présence des champs de texte
      expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
      print("✅ Champs Email et Password trouvés");

      // Vérifier la présence des boutons
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      expect(find.widgetWithText(TextButton, 'Create an Account'), findsOneWidget);
    });

  });


  testWidgets('Saisie et appui sur le bouton Login', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(demoProjectId: "demo-project-id",);
//    await tester.pumpWidget(const GetMaterialApp(home: LoginScreen()));
    // Réinitialise GetX et enregistre le FakeAuthController
    Get.reset();
    Get.put<AuthController>(FakeAuthController());

    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: Routes.login,  // Définit la route initiale comme dans ton app
        getPages: AppRouter.pages,   // Ajoute les pages GetX pour la navigation
      ),
    );
    // Entrer un email et un mot de passe
    await tester.enterText(find.byType(TextField).at(0), 'matigohh@gmail.com');
    await tester.enterText(find.byType(TextField).at(1), 'steeve');

    // Vérifier que le texte a été saisi
    expect(find.text('matigohh@gmail.com'), findsOneWidget);
    expect(find.text('steeve'), findsOneWidget);
    print("✅ Champs Email et Password Complétés");

    // Appuyer sur le bouton "Login"
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();  // Attend la navigation

    // Vérifie si l'utilisateur est bien dirigé vers la page d'accueil
    expect(find.byType(HomeScreen), findsOneWidget);
    print("✅ Navigation vers HomeScreen confirmée");
  });

}
