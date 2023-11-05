import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/login/domain/repositories/login_repository.dart';
import 'package:injector/features/login/domain/usecases/sign_in_usecase.dart';

class SignInUsecaseImpl implements SignInUsecase {

  final LoginRepository loginRepository;

  SignInUsecaseImpl(this.loginRepository);

  @override
  Future<Either<Failure, UserCredential>> signIn(String email, String password) {
    return loginRepository.signIn(email, password);
  }

}