// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/bloc.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/features/splash/presentation/bloc/splash_event.dart';

import '../../domain/usecases/credential_validator_usecase.dart';

class SplashBloc extends Bloc {
  CredentialValidatorUsecase credentialValidatorUseCase;
  SplashBloc(
    this.credentialValidatorUseCase,
  );

  @override
  mapListenEvent(event) {
    if (event is SplashEventCredentialValidator) {
      _handleCredentialValidator(event.context);
    }
  }

  Future _handleCredentialValidator(BuildContext context) async {
    final result = await credentialValidatorUseCase.credentialValidator();
    
    result.fold((l) => dispatchState(BlocErrorState(data: l.message)), (r) {
      navigateRemoveUntil(context, r.toString());
      inspect(r.toString());
      // Future.delayed(const Duration(seconds: 3)).then((value) =>
      //     Navigator.pushNamedAndRemoveUntil(
      //         context, r.toString(), (route) => false));
    });
  }
}
