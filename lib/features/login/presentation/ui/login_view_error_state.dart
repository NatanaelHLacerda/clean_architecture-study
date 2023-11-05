import 'package:flutter/cupertino.dart';

class LoginViewErrorState extends StatefulWidget {
  const LoginViewErrorState({super.key});

  @override
  State<LoginViewErrorState> createState() => _LoginViewErrorStateState();
}

class _LoginViewErrorStateState extends State<LoginViewErrorState> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('deu erro'),);
  }
}