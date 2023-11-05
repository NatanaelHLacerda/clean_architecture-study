import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:injector/core/architecture/bloc/bloc.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/core/architecture/bloc/event.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/domain/usecases/add_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/delete_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/edit_contact_usecase.dart';
import 'package:injector/features/home/domain/usecases/get_contacts_usecase.dart';
import 'package:injector/features/home/domain/usecases/sign_out_usecase.dart';
import 'package:injector/features/home/presentation/bloc/home_event.dart';

class HomeBloc extends Bloc {
  final SignOutUsecase signOutUsecase;
  final AddContactUsecase addContactUsecase;
  final GetContactsUsecase getContactsUsecase;
  final EditContactUsecase editContactUsecase;
  final DeleteContactUsecase deleteContactUsecase;

  late List<ContactModel> listContacts;

  HomeBloc(
    this.signOutUsecase,
    this.addContactUsecase,
    this.getContactsUsecase,
    this.editContactUsecase,
    this.deleteContactUsecase,
  ) {
    listContacts = [];
  }

  @override
  mapListenEvent(Event event) {
    if (event is HomeEventSignOut) {
      _handleSignOut(event.context);
    } else if (event is HomeEventAddContact) {
      _handleAddContact(event.paramets, event.context);
    } else if (event is HomeEventShowDialog) {
      _handleShowCustomDialog(event.context, event.dialog);
    } else if (event is HomeEventGetContacts) {
      _handleGetContacts();
    } else if (event is HomeEventEditContact) {
      _handleEditContact(event.parameters);
    } else if (event is HomeEventDeleteContact) {
      _handleDeleteContact(event.context, event.id);
    }
  }

  Future _handleDeleteContact(BuildContext context, String id) async {
    final result = await deleteContactUsecase.deleteContact(id);

    result.fold((l) => print('erro ao deletar contato'), (r) {
      listContacts.removeWhere((element) => element.id == id);

      dispatchState(BlocStableState(data: listContacts));

      showSnack(context, 'Contato deletado com sucesso');
    });
  }

  Future _handleEditContact(EditContactParameters parameters) async {
    final result = await editContactUsecase.editContact(parameters);

    result.fold((l) => print('erro ao editar contato'), (r) {
      listContacts.removeAt(parameters.index);

      listContacts.insert(parameters.index, r);
      dispatchState(BlocStableState(data: listContacts));

      showSnack(parameters.context, 'Contato editado com sucesso!');
      navigatePop(parameters.context);
    });
  }

  Future _handleGetContacts() async {
    final result = await getContactsUsecase.getContacts();

    result.fold((l) => print('Erro ao chamar a lista'), (r) {
      listContacts = r;
      if (listContacts.isEmpty) {
        dispatchState(BlocEmptyState(data: null));
      }
      dispatchState(BlocStableState(data: listContacts));
    });
  }

  Future _handleSignOut(BuildContext context) async {
    await signOutUsecase.signOut();

    navigateRemoveUntil(context, '/login');
  }

  Future _handleAddContact(
      ContactParamets paramets, BuildContext context) async {
    final result = await addContactUsecase.addContact(paramets);

    result.fold((l) => print('Erro ao adicionar contato'), (r) {
      listContacts.add(r);
      dispatchState(BlocStableState(data: listContacts));
      showSnack(context, 'Contato criado com sucesso');

      navigatePop(context);
    });
  }

  _handleShowCustomDialog(BuildContext context, Widget dialog) {
    showDialog(context: context, builder: (context) => dialog);
  }
}
