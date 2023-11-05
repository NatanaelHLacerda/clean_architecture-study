import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';

abstract class CredentialValidatorUsecase {
  Future<Either<Failure, String>> credentialValidator();
}
