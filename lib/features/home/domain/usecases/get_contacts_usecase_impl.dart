import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/get_contacts_usecase.dart';

class GetContactsUsecaseImpl implements GetContactsUsecase {

  final HomeRepository repository;

  GetContactsUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, List<ContactModel>>> getContacts() {
    return repository.getContacts();
  }
}