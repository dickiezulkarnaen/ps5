
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5/app/data/api/rawg_api.dart';

class BaseRepository {

  @protected
  final api = GetIt.instance<RawgApi>();

}