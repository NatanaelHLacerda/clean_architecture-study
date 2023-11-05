import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/service/auth_service.dart';
import 'package:injector/core/service/database_service.dart';
import 'package:injector/features/register/data/datasources/register_datasource.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final AuthService authService;
  final DatabaseService databaseService;

  RegisterDatasourceImpl(this.authService, this.databaseService);

  @override
  Future<UserCredential> signUp(String email, String password) async {
    print('chegou aqui');
    final futureUser = await authService.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    print('opa');
    inspect(futureUser);
    if (futureUser.user != null) {
      databaseService.instance
          .collection('users')
          .doc(authService.instance.currentUser!.uid)
          .set({'email': email});
    }
    inspect(futureUser);
    return futureUser;
  }
}
