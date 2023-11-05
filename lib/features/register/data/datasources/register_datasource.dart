import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterDatasource {
  Future<UserCredential> signUp(String email, String password);
}