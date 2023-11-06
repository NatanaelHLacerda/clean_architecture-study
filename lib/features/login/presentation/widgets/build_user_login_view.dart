import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class BuildUserLoginView extends StatefulWidget {
  final LoginBloc bloc;

  const BuildUserLoginView(
      {required this.bloc,
      
      super.key});

  @override
  State<BuildUserLoginView> createState() => _BuildUserLoginViewState();
}

class _BuildUserLoginViewState extends State<BuildUserLoginView> {
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

                    Future.delayed(const Duration(seconds: 2))
                        .then((_) => widget.bloc.dispatchEvent(LoginEventSignIn(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context,
                            )));
                  },
                  child: const Text('logar'))
              : const ElevatedButton(
                  onPressed: null, child: CircularProgressIndicator.adaptive()),
              const SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/register');
              }, child: const Text('Criar conta'))
        ],
      ),
    );
  }
}
