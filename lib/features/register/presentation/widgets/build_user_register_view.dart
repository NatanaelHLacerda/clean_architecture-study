import 'package:flutter/material.dart';
import 'package:injector/features/register/presentation/bloc/register_bloc.dart';
import 'package:injector/features/register/presentation/bloc/register_event.dart';

class BuildUserRegisterView extends StatefulWidget {
  final RegisterBloc bloc;
  const BuildUserRegisterView({
    super.key,
    required this.bloc,
  });

  @override
  State<BuildUserRegisterView> createState() => _BuildUserRegisterViewState();
}

class _BuildUserRegisterViewState extends State<BuildUserRegisterView> {
  late bool isLoading;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          isLoading == false
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });

                    widget.bloc.dispatchEvent(RegisterEventSignOut(
                      context: context,
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                  },
                  child: const Text('Cadastre-se'))
              : const ElevatedButton(
                  onPressed: null, child: CircularProgressIndicator.adaptive()),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Logara'))
        ],
      ),
    );
  }
}
