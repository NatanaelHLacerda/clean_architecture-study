import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';
import 'package:injector/features/home/domain/usecases/edit_contact_usecase.dart';

class EditContactUsecaseImpl implements EditContactUsecase {

  final HomeRepository repository;

  EditContactUsecaseImpl(this.repository);

  @override
  Future<Either<Failure, ContactModel>> editContact(EditContactParameters parameters) {
    return repository.editContact(parameters);
  }

}