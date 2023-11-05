import 'dart:developer';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/core/service/auth_service.dart';
import 'package:injector/core/service/database_service.dart';
import 'package:injector/features/home/data/datasources/home_datasources.dart';
import 'package:injector/features/home/data/model/contact_model.dart';

class HomeDataSourcesImpl implements HomeDataSources {
  final AuthService authService;
  final DatabaseService databaseService;
  HomeDataSourcesImpl(
    this.authService,
    this.databaseService,
  );

  @override
  Future<void> signOut() async {
    return await authService.instance.signOut();
  }

  @override
  Future<ContactModel> addContact(ContactParamets paramets) async {
    final doc = databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc();

    final ContactModel model = ContactModel(
      name: paramets.name,
      email: paramets.email,
      phone: paramets.phone,
      id: doc.id,
    );

    inspect(model);

    await doc.set(toMap(model));

    return model;
  }

  @override
  Future<List<ContactModel>> getContact() async {
    final doc = await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .get();

    return doc.docs.map((e) => ContactModel.fromMap(e)).toList();
  }

  @override
  Future<ContactModel> editContact(EditContactParameters parameters) async {
    final ContactModel editedContact = ContactModel(
        name: parameters.name,
        email: parameters.email,
        phone: parameters.email,
        id: parameters.id);

    final doc = databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc(parameters.id);

    doc.update(toMap(editedContact));

    return editedContact;
  }

  @override
  Future<String> deleteContact(String id) async {
    await databaseService.instance
        .collection('users')
        .doc(authService.instance.currentUser!.uid)
        .collection('contacts')
        .doc(id)
        .delete();

    return id;
  }
}
