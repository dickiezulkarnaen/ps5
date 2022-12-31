

import 'package:ps5_dicky_iskandar_z/app/models/games_response.dart';

class MainState {}

class LoadingMainState extends MainState {}

class LoadingMoreMainState extends MainState {}

class LoadedMainState extends MainState {
  final List<Results?> games;
  LoadedMainState(this.games);
}

class ErrorMainState extends MainState {
  final String? message;
  ErrorMainState(this.message);
}