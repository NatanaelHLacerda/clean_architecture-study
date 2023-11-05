import 'package:flutter/cupertino.dart';
import 'package:injector/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashViewStableState extends StatefulWidget {
  final SplashBloc bloc;
  const SplashViewStableState({required this.bloc, super.key});

  @override
  State<SplashViewStableState> createState() => _SplashViewStableStateState();
}

class _SplashViewStableStateState extends State<SplashViewStableState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/lotties/splash_lottie.json', height: 150),
    );
  }
}
