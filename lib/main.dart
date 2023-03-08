import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5/app/data/local/local_database.dart';
import 'package:ps5/app/data/local/local_database_usecase.dart';
import 'package:ps5/app_routes.dart';

import 'setup_dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SetupDependencyInjection.init();
  await LocalDatabase.initialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLoggedIn = LocalDatabase.isLoggedIn();
    return MaterialApp(
      title: 'Playstation 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLoggedIn ? Pages.main : Pages.login,
      routes: AppRoutes.pages,
    );
  }
}


