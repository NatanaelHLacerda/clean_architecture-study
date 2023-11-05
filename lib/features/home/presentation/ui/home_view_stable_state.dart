import 'package:flutter/material.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/presentation/bloc/home_bloc.dart';
import 'package:injector/features/home/presentation/bloc/home_event.dart';
import 'package:injector/features/home/presentation/widgets/add_edit_contact_custom_dialog.dart';

class HomeViewStableState extends StatefulWidget {
  final List<ContactModel> listContacts;
  final HomeBloc bloc;

  const HomeViewStableState({
    super.key,
    required this.listContacts,
    required this.bloc,
  });

  @override
  State<HomeViewStableState> createState() => _HomeViewStableStateState();
}

class _HomeViewStableStateState extends State<HomeViewStableState> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listContacts.length,
        itemBuilder: (context, index) {
          final ContactModel contact = widget.listContacts[index];
          return Dismissible(
            key: Key(contact.id),
            onDismissed: (direction) => widget.bloc.dispatchEvent(
                HomeEventDeleteContact(context: context, id: contact.id)),
            background: Container(
              color: Colors.redAccent,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: Card(
                child: ListTile(
              leading: IconButton(
                  onPressed: () =>
                      widget.bloc.dispatchEvent(HomeEventShowDialog(
                          context: context,
                          dialog: AddEditContactCustomDialog(
                            index: index,
                            bloc: widget.bloc,
                            edit: true,
                            model: contact,
                          ))),
                  icon: const Icon(Icons.edit)),
              title: Text(contact.name),
              subtitle: Text(contact.email),
              trailing: Text(contact.phone),
            )),
          );
        });
  }
}
