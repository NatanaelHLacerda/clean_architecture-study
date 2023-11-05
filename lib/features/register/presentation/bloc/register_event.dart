import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/event.dart';

class RegisterEvent extends Event {}

class RegisterEventSignOut implements Event {
  final String email;
  final String password;
  final BuildContext context;

  RegisterEventSignOut({
    required this.context,
    required this.email,
    required this.password,
  });
}
