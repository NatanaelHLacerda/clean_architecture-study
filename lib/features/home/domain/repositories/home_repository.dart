import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

abstract class HomeRepository {
  Future<void> signOut();

  Future<Either<Failure, ContactModel>> addContact(ContactParamets paramets);

  Future<Either<Failure, List<ContactModel>>> getContacts();

  Future<Either<Failure, ContactModel>> editContact(EditContactParameters parameters);

  Future<Either<Failure, String>> deleteContact(String id);
}