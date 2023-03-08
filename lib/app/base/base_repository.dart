
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5/app/data/api/rawg_api.dart';
import 'package:ps5/app/data/local/local_database.dart';
import 'package:ps5/app/data/local/local_database_usecase.dart';
import 'package:ps5/app/repositories/auth_repository.dart';
import 'package:ps5/app/repositories/auth_repository_usecase.dart';

class BaseRepository {

  @protected
  final api = GetIt.instance<RawgApi>();

}