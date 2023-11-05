import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/service/auth_service.dart';
import 'package:injector/features/login/data/datasources/login_datasource.dart';

class LoginDatasourcesImpl implements LoginDatasources {
  final AuthService authService;

  LoginDatasourcesImpl(this.authService);

  @override
  Future<UserCredential> signIn(String email, String password) async {
    return await authService.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
