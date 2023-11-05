import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/add_contact_usecase.dart';

class AddContactUsecaseImpl implements AddContactUsecase {
  final HomeRepository repository;

  AddContactUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, ContactModel>> addContact(ContactParamets paramets) {
    return repository.addContact(paramets);
  }
}
