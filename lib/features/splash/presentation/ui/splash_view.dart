import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/features/splash/presentation/bloc/splash_event.dart';
import 'package:injector/features/splash/presentation/ui/splash_view_error_state.dart';
import 'package:injector/features/splash/presentation/ui/splash_view_stable_state.dart';

import '../bloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late SplashBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    
    bloc.dispatchEvent(SplashEventCredentialValidator(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: bloc.state,
          builder: (context, snapShot) {
            print('chegou aqui');
            if (snapShot.hasData) {
              if (snapShot.data is BlocStableState) {
                return SplashViewStableState(
                  bloc: bloc,
                );
              } else if (snapShot.data is BlocErrorState) {
                return SplashViewErrorState(
                  message: snapShot.data!.data,
                );
              }
            }
            return Container();
          }),
    );
  }
}
