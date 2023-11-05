import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserCredential>> signUp(String email, String password);
}