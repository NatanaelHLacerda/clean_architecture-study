import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/register/data/datasources/register_datasource.dart';
import 'package:injector/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository{

  final RegisterDatasource datasource;

  RegisterRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, UserCredential>> signUp(String email, String password) async{
    try {
      return Right(await datasource.signUp(email, password));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

}