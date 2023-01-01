

import 'package:ps5_dicky_iskandar_z/app/models/game_detail_response.dart';
import 'package:ps5_dicky_iskandar_z/app/models/game_screen_shot_response.dart';

class DetailState {}

class LoadingDetailState extends DetailState {}

class LoadedDetailState extends DetailState {
  final GameDetailResponse gameDetail;
  LoadedDetailState(this.gameDetail);
}

class LoadedScreenShotState extends LoadedDetailState {
  final GameScreenShotsResponse data;
  LoadedScreenShotState(this.data, GameDetailResponse gameDetail) : super(gameDetail);
}

class LoadingScreenShotState extends LoadedDetailState {
  LoadingScreenShotState(GameDetailResponse gameDetail) : super(gameDetail);
}

class ErrorDetailState extends DetailState {
  final String? message;
  ErrorDetailState(this.message);
}