import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDatasources {
  Future<UserCredential> signIn(String email, String password);
}