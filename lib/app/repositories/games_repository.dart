
import 'package:ps5_dicky_iskandar_z/app/base/base_repository.dart';
import 'package:ps5_dicky_iskandar_z/app/constants/constants.dart';
import 'package:ps5_dicky_iskandar_z/core/completion.dart';

class GamesRepository extends BaseRepository {

  Future<Completion> getPlaystation5Games(int page, int pageSize, String dates) {
    final params = {
      'platforms': 187,
      'ordering': '-released',
      'page': page,
      'page_size': pageSize,
      'dates': dates,
      'key': ApiConstant.rawgApiKey
    };
    return api.get(path: 'games', params: params);
  }

}