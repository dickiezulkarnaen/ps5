import 'package:get_it/get_it.dart';
import 'package:ps5_dicky_iskandar_z/app/data/api/rawg_api.dart';
import 'package:ps5_dicky_iskandar_z/app/repositories/games_repository.dart';

class SetupDependencyInjection {

  static final _getIt = GetIt.instance;

  static void init() {
    _getIt.registerSingleton<RawgApi>(RawgApi());
    _getIt.registerSingleton<GamesRepository>(GamesRepository());
  }

}