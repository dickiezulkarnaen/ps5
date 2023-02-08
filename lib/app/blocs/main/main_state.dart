

import 'package:ps5/app/models/games_response.dart';

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

class ErrorLoadingMoreMainState extends LoadedMainState {
  final String? message;
  ErrorLoadingMoreMainState(this.message, List<Results?> games) : super(games);
}