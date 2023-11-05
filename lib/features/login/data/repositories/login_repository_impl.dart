import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/login/data/datasources/login_datasource.dart';
import 'package:injector/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {

  final LoginDatasources loginDatasources;

  LoginRepositoryImpl(this.loginDatasources);

  @override
  Future<Either<Failure, UserCredential>> signIn(String email, String password) async{
    try {
      return Right(await loginDatasources.signIn(email, password));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

}