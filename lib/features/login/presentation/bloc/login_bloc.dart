import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/bloc.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/core/architecture/bloc/event.dart';
import 'package:injector/features/login/domain/usecases/sign_in_usecase.dart';
import 'package:injector/features/login/presentation/bloc/login_event.dart';

class LoginBloc extends Bloc {
  final SignInUsecase signInUsecase;

  LoginBloc(this.signInUsecase);

  @override
  mapListenEvent(Event event) {
    if (event is LoginEventSignIn) {
      _handleSignIn(event.context, event.email, event.password);
    }
  }

  _handleSignIn(BuildContext context, String email, String password) async {

    dispatchState(BlocLoadingState(data: null));
    final result = await signInUsecase.signIn(email, password);

    result.fold((l) => dispatchState(BlocErrorState(data: l.message)),
        (r) {
          showSnack(context, 'Logado com sucesso');
          navigateRemoveUntil(context, '/home');
        });
  }
}
