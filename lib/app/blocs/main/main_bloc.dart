import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_event.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/main/main_state.dart';
import 'package:ps5_dicky_iskandar_z/app/models/games_response.dart';
import 'package:ps5_dicky_iskandar_z/app/repositories/games_repository.dart';
import 'package:ps5_dicky_iskandar_z/utils/date_util.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(LoadingMainState()) {
    on<FetchEvent>((event, emit) async => _onInitialFetch(emit));
    on<FetchMoreEvent>((event, emit) async => _onFetchingNextPage(emit));
  }

  final _repo = GetIt.instance<GamesRepository>();

  int _page = 1;
  bool hasMorePage = false;

  final games = <Results>[];

  Future<void> _getPlaystation5Games(Emitter<MainState> emitter) async {
    final res = await _repo.getPlaystation5Games(_page, 20, _getDatesParam(),);
    if (res.isSuccessful) {
      final data = GamesResponse.fromJson(res.result);
      hasMorePage = data.next != null;
      data.results?.forEach((e) => games.add(e));
      emitter(LoadedMainState(games));
    } else {
      if (_page > 1) {
        emitter(ErrorLoadingMoreMainState(res.message, games));
      } else {
        emitter(ErrorMainState(res.message));
      }
    }
  }

  String _getDatesParam() {
    final current = DateTime.now();
    final currentFormatted = current.toFormattedString(format: usedDateFormat);
    final oneYearBeforeNow = _getOneYearBefore(currentDate: current).toFormattedString(format: usedDateFormat);
    return '$currentFormatted-$oneYearBeforeNow';
  }

  DateTime _getOneYearBefore({required DateTime currentDate}) {
    final oneYearBefore = currentDate.subtract(const Duration(days: 365));
    return oneYearBefore;
  }

  void _resetPage() {
    _page = 1;
    hasMorePage = false;
  }

  Future<void> _onInitialFetch(Emitter<MainState> emitter) async {
    _resetPage();
    emitter(LoadingMainState());
    await _getPlaystation5Games(emitter);
  }

  Future<void> _onFetchingNextPage(Emitter<MainState> emitter) async {
    if (hasMorePage) {
      _page++;
      emitter(LoadingMoreMainState());
      await _getPlaystation5Games(emitter);
    }
  }

  static String usedDateFormat = 'yyyy-MM-dd';

}