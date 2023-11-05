import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, String>> credentialValidation();
}
