import 'package:get_it/get_it.dart';
import 'package:ps5/app/data/api/rawg_api.dart';
import 'package:ps5/app/repositories/auth_repository.dart';
import 'package:ps5/app/repositories/auth_repository_usecase.dart';
import 'package:ps5/app/repositories/games_repository.dart';
import 'package:ps5/app/repositories/user_repository.dart';
import 'package:ps5/app/repositories/user_repository_usecase.dart';

class SetupDependencyInjection {

  static final _getIt = GetIt.instance;

  static Future<void> init() async {
    _getIt.registerSingleton<RawgApi>(RawgApi());
    _getIt.registerSingleton<GamesRepository>(GamesRepository());
    _getIt.registerSingleton<IUserRepository>(UserRepository());
    _getIt.registerSingleton<IAuthRepository>(AuthRepository());
  }

}