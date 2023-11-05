import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/event.dart';

class SplashEvent extends Event {}

class SplashEventOnReady implements SplashEvent {
  final BuildContext context;

  SplashEventOnReady(this.context);
}

class SplashEventCredentialValidator implements SplashEvent {
  final BuildContext context;

  SplashEventCredentialValidator({required this.context});
}
