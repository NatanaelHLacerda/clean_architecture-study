import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/event.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';

class HomeEvent extends Event {}

class HomeEventSignOut implements HomeEvent {
  final BuildContext context;

  HomeEventSignOut({required this.context});
}

class HomeEventAddContact implements HomeEvent {
  final ContactParamets paramets;
  final BuildContext context;

  HomeEventAddContact({required this.paramets, required this.context});
}

class HomeEventShowDialog implements HomeEvent {
  final BuildContext context;
  final Widget dialog;

  HomeEventShowDialog({
    required this.context,
    required this.dialog,
  });
}

class HomeEventGetContacts implements HomeEvent {}

class HomeEventEditContact implements HomeEvent {
  final EditContactParameters parameters;

  HomeEventEditContact(this.parameters);
}

class HomeEventDeleteContact implements HomeEvent {
  final BuildContext context;
  final String id;

  HomeEventDeleteContact({required this.context, required this.id});
}
