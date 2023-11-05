import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/features/login/presentation/bloc/login_bloc.dart';
import 'package:injector/features/login/presentation/ui/login_view_error_state.dart';
import 'package:injector/features/login/presentation/widgets/build_user_login_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.state,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is BlocErrorState) {
                return const LoginViewErrorState();
              }
            }
            return BuildUserLoginView(
              bloc: bloc,
            );
          })),
    );
  }
}
