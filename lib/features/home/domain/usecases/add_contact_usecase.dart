import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

abstract class AddContactUsecase {
  Future<Either<Failure, ContactModel>> addContact(ContactParamets paramets);
}