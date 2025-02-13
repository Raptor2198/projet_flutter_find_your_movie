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

🔧 2. Configurer les clés d'API sensibles
Pour des raisons de sécurité, certaines informations sensibles ne sont pas incluses dans le dépôt.
Créez un fichier .env à la racine du projet et ajoutez-y les variables suivantes :

API_KEY=VOTRE_API_KEY
BASE_URL=
IMAGE_BASE_URL=
Remarque : Remplacez VOTRE_API_KEY par votre clé TMDb réelle.

Les valeurs de ce fichier seront accessibles dans le code grâce au package Envied (vous avez ajouté envied_generator dans votre projet).

Si vous utilisez également Firebase, assurez-vous que la configuration Firebase est correctement mise en place dans votre fichier firebase_options.dart.
➡️ Remplacez "VOTRE_API_KEY" par votre clé TMDb.

▶️ 3. Exécuter l'application
Assurez-vous d’avoir Flutter installé puis exécutez :

flutter pub get  # Installation des dépendances
flutter run      # Lancer l'application

💬 Contact & Collaboration
📧 Email : steeveandriatsilavomitchel@gmail.com
🔗 GitHub : Raptor2198


