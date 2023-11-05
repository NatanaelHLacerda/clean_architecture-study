import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';

abstract class DeleteContactUsecase {
  Future<Either<Failure, String>> deleteContact(String id);
}