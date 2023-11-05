import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

abstract class GetContactsUsecase {
  Future<Either<Failure, List<ContactModel>>> getContacts ();
}