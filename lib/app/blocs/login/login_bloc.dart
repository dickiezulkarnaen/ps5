
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:ps5/app/models/user_model.dart';
import 'package:ps5/app/repositories/auth_repository_usecase.dart';
import 'package:ps5/utils/logger_util.dart';

import '../../repositories/user_repository_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _userRepo = GetIt.instance<IUserRepository>();
  final _authRepo = GetIt.instance<IAuthRepository>();

  String _email = '';
  String _password = '';

  LoginBloc() : super(LoginState()) {
    on<OnInputEmailEvent>((event, emit) => _onEmailValueUpdated(event.email));
    on<OnInputPasswordEvent>((event, emit) => _onPasswordValueUpdated(event.password));
    on<OnLoginEvent>((event, emit) => _doLoginWithEmailAndPassword(emit));
  }

  _onEmailValueUpdated(String value) {
    _email = value;
  }

  _onPasswordValueUpdated(String value) {
    _password = value;
  }

  Future<void> _doLoginWithEmailAndPassword(Emitter<LoginState> emitter) async {
    emitter(LoadingLoginState());
    final req = await _authRepo.doLoginWithEmailAndPassword(_email, _password);
    if (req.isSuccessful) {
      final res = req.result;
      await _getUser(res['email']);
      _authRepo.setIsLoggedIn(true);
      emitter(SuccessLoginState());
    } else {
      emitter(ErrorLoginState(req.message));
    }
    emitter(FinishLoadingLoginState());
  }

  Future<void> _getUser(String email) async {
    final req = await _userRepo.getUserFromServer(email);
    if (req.isSuccessful) {
      final user = UserModel.fromJson(req.result);
      Logging.debug(user.toJson());
    }
  }

}