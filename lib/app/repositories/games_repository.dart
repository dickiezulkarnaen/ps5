
import 'package:ps5/app/base/base_repository.dart';
import 'package:ps5/app/constants/constants.dart';
import 'package:ps5/core/completion.dart';

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

  Future<Completion> getGameDetail(int gameId) {
    return api.get(path: 'games/$gameId', params: {'key': ApiConstant.rawgApiKey});
  }

  Future<Completion> getGameScreenShots(int gamePK) {
    return api.get(path: 'games/$gamePK/screenshots', params: {'key': ApiConstant.rawgApiKey});
  }

}