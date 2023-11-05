import 'package:flutter/material.dart';

class RegisterViewErrorState extends StatefulWidget {
  const RegisterViewErrorState({super.key});

  @override
  State<RegisterViewErrorState> createState() => _RegisterViewErrorStateState();
}

class _RegisterViewErrorStateState extends State<RegisterViewErrorState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Error'),
    );
  }
}
