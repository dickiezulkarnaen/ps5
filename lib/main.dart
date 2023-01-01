import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/pages/detail_page.dart';
import 'package:ps5_dicky_iskandar_z/app/pages/image_preview_page.dart';
import 'package:ps5_dicky_iskandar_z/app/pages/main_page.dart';

import 'setup_dependency_injection.dart';

void main() {
  SetupDependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playstation 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => BlocProvider<MainBloc>(create: (context) => MainBloc(), child: const MainPage(),),
        '/detail' : (context) => BlocProvider<DetailBloc>(create: (context) => DetailBloc(), child:  const DetailPage(),),
        '/image-preview' : (context) => const ImagePreviewPage(),
      },
    );
  }
}


