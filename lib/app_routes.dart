import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:projet_flutter_find_your_movie/views/home/login_screen.dart';
import 'views/auth/register_screen.dart';
import 'views/home/home_screen.dart';
import 'views/splash/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
}

class AppRouter {
  static final pages = [
    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.register, page: () => RegisterScreen()),

  ];

//
//   (
//   initialLocation: '/',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const SplashScreen(),
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (context, state) => const HomeScreen(),
//     ),
//     GoRoute(
//     path: '/login',
//     builder: (context, state) => const LoginScreen(),
//     ),
//   ],
// );
}
