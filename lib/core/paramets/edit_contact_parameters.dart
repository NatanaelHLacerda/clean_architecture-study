import 'package:flutter/material.dart';

class EditContactParameters {
  final String name;
  final String email;
  final String phone;
  final String id;
  final int index;
  final BuildContext context;

  EditContactParameters(
      {required this.name,
      required this.email,
      required this.phone,
      required this.id,
      required this.index,
      required this.context});
}
