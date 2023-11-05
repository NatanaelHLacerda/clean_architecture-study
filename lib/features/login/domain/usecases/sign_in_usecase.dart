import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';

abstract class SignInUsecase {
  Future<Either<Failure, UserCredential>> signIn(String email, String password);
}