import 'package:dartz/dartz.dart';
import 'package:injector/features/splash/data/datasources/splash_datasources.dart';
import 'package:injector/features/splash/domain/repositories/splash_repository.dart';

import '../../../../core/failure/failure.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashDatasources datasources;

  SplashRepositoryImpl(this.datasources);

  @override
  Future<Either<Failure, String>> credentialValidation() async {
    try {
      return Right(await datasources.credentialValidation());
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
