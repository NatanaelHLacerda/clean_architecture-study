import 'package:dartz/dartz.dart';
import 'package:injector/features/splash/domain/repositories/splash_repository.dart';
import 'package:injector/features/splash/domain/usecases/credential_validator_usecase.dart';

import '../../../../core/failure/failure.dart';

class CredentialValidatorUsecaseImpl implements CredentialValidatorUsecase {
  final SplashRepository repository;

  CredentialValidatorUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, String>> credentialValidator() async {
    return await repository.credentialValidation();
  }
}
