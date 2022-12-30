import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_event.dart';
import 'package:ps5_dicky_iskandar_z/app/blocs/detail/detail_state.dart';


class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super (DetailState());

}