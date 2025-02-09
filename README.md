🎬 Find Your Movie
🚀 Application Flutter pour explorer les films populaires et leurs détails.


📌 Présentation
Find Your Movie est une application mobile développée en Flutter qui permet aux utilisateurs de :
✅ Explorer les films populaires en temps réel.
✅ Voir les détails d'un film (titre, synopsis, note, etc.).
✅ Regarder la bande-annonce des films.
✅ Découvrir des films similaires.

Les données sont obtenues via The Movie Database (TMDb).

🛠️ Technologies utilisées
🏗️ Flutter & Dart → Développement mobile
🎥 TMDb API → Source des films
🔥 Firebase → Backend et authentification
🚀 GetX → Gestion d'état et navigation
🌐 http → Requêtes API
🚀 Installation & Configuration
📥 1. Cloner le projet

git clone https://github.com/Raptor2198/projet_flutter_find_your_movie.git
cd projet_flutter_find_your_movie

🔧 2. Ajouter les fichiers sensibles
Certains fichiers ne sont pas inclus pour des raisons de sécurité. Ajoutez-les manuellement :

📌 Fichiers à créer :

lib/constants/api_constants.dart

lib/firebase_options.dart

📌 Exemple de api_constants.dart :

class ApiConstants {
static const String baseUrl = 'https://api.themoviedb.org/3';
static const String apiKey = 'VOTRE_API_KEY';
static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';
}
➡️ Remplacez "VOTRE_API_KEY" par votre clé TMDb.

▶️ 3. Exécuter l'application
Assurez-vous d’avoir Flutter installé puis exécutez :

flutter pub get  # Installation des dépendances
flutter run      # Lancer l'application

💬 Contact & Collaboration
📧 Email : steeveandriatsilavomitchel@gmail.com
🔗 GitHub : Raptor2198


