
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5_dicky_iskandar_z/app/data/api/rawg_api.dart';

class BaseRepository {

  @protected
  final api = GetIt.instance<RawgApi>();

}