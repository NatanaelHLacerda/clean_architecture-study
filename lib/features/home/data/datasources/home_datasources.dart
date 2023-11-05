import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

abstract class HomeDataSources {
  Future<void> signOut();

  Future<ContactModel> addContact(ContactParamets paramets);

  Future<List<ContactModel>> getContact();

  Future<ContactModel> editContact(EditContactParameters parameters);

  Future<String> deleteContact(String id);
}