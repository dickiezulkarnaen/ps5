import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_event.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_state.dart';
import 'package:ps5_dicky_iskandar_z/app/models/game_detail_response.dart';
import 'package:ps5_dicky_iskandar_z/app/models/game_screen_shot_response.dart';
import 'package:ps5_dicky_iskandar_z/app/repositories/games_repository.dart';


class DetailBloc extends Bloc<DetailEvent, DetailState> {

  final _repo = GetIt.instance<GamesRepository>();

  DetailBloc() : super (LoadingDetailState()) {
    on<GetDetailEvent>((event, emit) => _getGameDetail(event.id, emit));
    on<GetScreenShotsEvent>((event, emit) => _getGameScreenShots(event.id, emit));
  }

  Future<void> _getGameDetail(int gameId, Emitter<DetailState> emitter) async {
    final res = await _repo.getGameDetail(gameId);
    if (res.isSuccessful) {
      final data = GameDetailResponse.fromJson(res.result);
      emitter(LoadedDetailState(data));
      if (data.id != null) add(GetScreenShotsEvent(data.id!));
    } else {
      emitter(ErrorDetailState(res.message));
    }
  }

  Future<void> _getGameScreenShots(int id, Emitter<DetailState> emitter) async {
    emitter(LoadingScreenShotState((state as LoadedDetailState).gameDetail));
    final res = await _repo.getGameScreenShots(id);
    if (res.isSuccessful) {
      final data = GameScreenShotsResponse.fromJson(res.result);
      emitter(LoadedScreenShotState(data, (state as LoadedDetailState).gameDetail));
    } else {
      emitter(ErrorDetailState(res.message));
    }
  }

}