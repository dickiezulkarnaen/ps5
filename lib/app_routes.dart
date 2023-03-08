import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5/app/blocs/login/login_bloc.dart';
import 'package:ps5/app/pages/login_page.dart';

import 'app/blocs/detail/detail_bloc.dart';
import 'app/blocs/main/main_bloc.dart';
import 'app/pages/detail_page.dart';
import 'app/pages/image_preview_page.dart';
import 'app/pages/main_page.dart';

class AppRoutes {

  static final pages = <String, WidgetBuilder>{
    Pages.login : (context) => BlocProvider<LoginBloc>(create: (context) => LoginBloc(), child: const LoginPage(),),
    Pages.main : (context) => BlocProvider<MainBloc>(create: (context) => MainBloc(), child: const MainPage(),),
    Pages.detail : (context) => BlocProvider<DetailBloc>(create: (context) => DetailBloc(), child:  const DetailPage(),),
    Pages.imagePreview : (context) => const ImagePreviewPage(),
  };
}

class Pages {
  static const main = '/main';
  static const detail = '/detail';
  static const imagePreview = '/image-preview';
  static const login = '/login';
}