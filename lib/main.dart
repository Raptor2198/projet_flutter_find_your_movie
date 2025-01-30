import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(demoProjectId: "demo-project-id",);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Quiz App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppRouter.pages,

      //routerConfig: AppRouter().route,
      //make sure you must not add any other data like
      //"routeInformationParser" and "routerDelegate" they'll cause error
    );



      // GetMaterialApp.router(
      // debugShowCheckedModeBanner: false,
      // routerDelegate: appRouter.routerDelegate,
      // routeInformationParser: appRouter.routeInformationParser,
      //
      // theme: ThemeData(primarySwatch: Colors.blue),
    //);
  }
}
