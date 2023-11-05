import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/event.dart';

class LoginEvent extends Event {}

class LoginEventSignIn implements Event {
  final String email;
  final String password;
  final BuildContext context;

  LoginEventSignIn({required this.context, required this.email, required this.password});
}