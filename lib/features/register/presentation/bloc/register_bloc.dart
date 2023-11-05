import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/bloc.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/core/architecture/bloc/event.dart';
import 'package:injector/features/register/domain/usecases/sign_up_usecase.dart';
import 'package:injector/features/register/presentation/bloc/register_event.dart';

class RegisterBloc extends Bloc {
  final SignUpUsecase signUpUsecase;
  RegisterBloc(this.signUpUsecase);

  @override
  mapListenEvent(Event event) {
    if (event is RegisterEventSignOut) {
      _handleSignOut(event.context, event.email, event.password);
    }
  }

  _handleSignOut(BuildContext context, String email, String password) async {
    final result = await signUpUsecase.signUp(email, password);

    result.fold((l) => dispatchState(BlocErrorState(data: l.message)), (r) {
      showSnack(context, 'Usuário criado com sucesso');
      Future.delayed(const Duration(seconds: 2))
          .then((value) => navigatePop(context));
    });
  }
}
