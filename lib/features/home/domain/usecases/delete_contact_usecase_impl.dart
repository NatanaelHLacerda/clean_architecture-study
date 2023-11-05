import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/delete_contact_usecase.dart';

class DeleteContactUsecaseImpl implements DeleteContactUsecase {

  final HomeRepository repository;

  DeleteContactUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, String>> deleteContact(String id) {
    return repository.deleteContact(id);
  }
}