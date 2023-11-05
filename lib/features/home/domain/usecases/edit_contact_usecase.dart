import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

abstract class EditContactUsecase {
  Future<Either<Failure, ContactModel>> editContact(
      EditContactParameters parameters);
}
