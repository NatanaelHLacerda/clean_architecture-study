import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/features/register/presentation/bloc/register_bloc.dart';
import 'package:injector/features/register/presentation/ui/register_view_error_state.dart';
import 'package:injector/features/register/presentation/ui/register_view_stable_state.dart';
import 'package:injector/features/register/presentation/widgets/build_user_register_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late RegisterBloc bloc;
  
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
        builder: (context, snapshot){
          if (snapshot.hasData) {
            if (snapshot.data is BlocStableState) {
              return const RegisterViewStableState();
            } else if (snapshot.data is BlocErrorState) {
              print('ERRRRRRRRR');
              return const RegisterViewErrorState();
            }
          }
          return BuildUserRegisterView(
            bloc: bloc,
          );
        }),
    );
  }
}