import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/register/domain/repositories/register_repository.dart';
import 'package:injector/features/register/domain/usecases/sign_up_usecase.dart';

class SignUpUsecaseImpl implements  SignUpUsecase{
  final RegisterRepository repository;

  SignUpUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, UserCredential>> signUp(String email, String password) {
    return repository.signUp(email, password);
  }
  
}