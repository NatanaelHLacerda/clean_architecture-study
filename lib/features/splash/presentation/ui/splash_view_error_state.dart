import 'package:flutter/material.dart';

class SplashViewErrorState extends StatelessWidget {
  final String message;

  const SplashViewErrorState({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text(message),
      ),
    );
  }
}
