import 'package:dartz/dartz.dart';
import 'package:injector/core/failure/failure.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/datasources/home_datasources.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeDataSources dataSources;

  HomeRepositoryImpl(this.dataSources);

  @override
  Future<void> signOut() {
    return dataSources.signOut();
  }

  @override
  Future<Either<Failure, ContactModel>> addContact(ContactParamets paramets) async{
    try {
      return Right(await dataSources.addContact(paramets));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<ContactModel>>> getContacts() async{
    try {
      return Right(await dataSources.getContact());
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, ContactModel>> editContact(EditContactParameters parameters) async{
    try {
      return Right(await dataSources.editContact(parameters));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, String>> deleteContact(String id) async{
    try {
      return Right(await dataSources.deleteContact(id));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  } 

}