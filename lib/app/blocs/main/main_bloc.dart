

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_event.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_state.dart';
import 'package:ps5_dicky_iskandar_z/app/models/games_response.dart';
import 'package:ps5_dicky_iskandar_z/app/repositories/games_repository.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(LoadingMainState()) {
    on<FetchingEvent>((_, emit) => _getPlaystation5Games(emit));
  }

  final _repo = GetIt.instance<GamesRepository>();

  Future<void> _getPlaystation5Games(Emitter<MainState> emitter) async {
    emitter(LoadingMainState());
    final res = await _repo.getPlaystation5Games(1, 20, '2020-12-21,2021-12-21',);
    final data = GamesResponse.fromJson(res.result).results;
    emitter(LoadedMainState(data ?? []));
  }

}