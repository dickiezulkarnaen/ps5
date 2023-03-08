import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5/app/blocs/login/login_bloc.dart';
import 'package:ps5/app/blocs/login/login_event.dart';
import 'package:ps5/app/blocs/login/login_state.dart';
import 'package:ps5/app/pages/main_page.dart';
import 'package:ps5/app_routes.dart';
import 'package:ps5/utils/loading_dialog_helper.dart';
import 'package:ps5/utils/snack_bar_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static void route(BuildContext context) {
    Navigator.popAndPushNamed(context, Pages.login);
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late final LoginBloc _bloc;

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _bloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is ErrorLoginState) {
            _scaffoldKey.currentState?.context.showSnackBar(state.message);
          }
          if (state is LoadingLoginState) {
            LoadingHelper.showLoadingDialog(context);
          } else {
            LoadingHelper.hideLoadingDialog();
          }
          if (state is SuccessLoginState) {
            MainPage.route(context);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          bloc: _bloc,
          builder: (context, state) => Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _emailField(),
                  const SizedBox(height: 20,),
                  _passwordField(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: const Text('Login'),
            onPressed: () => {
              _bloc.add(OnLoginEvent())
            },
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      onChanged: (value) => _bloc.add(OnInputEmailEvent(value)),
      controller: _userNameController,
      decoration: const InputDecoration(
        label: Text('Email'),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      onChanged: (value) => _bloc.add(OnInputPasswordEvent(value)),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      controller: _passwordController,
      decoration: const InputDecoration(
        label: Text('Password'),
        border: OutlineInputBorder(),
      ),
    );
  }
}
