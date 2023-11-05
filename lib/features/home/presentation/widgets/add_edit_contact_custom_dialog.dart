import 'package:flutter/material.dart';
import 'package:injector/core/paramets/contact_paramets.dart';
import 'package:injector/core/paramets/edit_contact_parameters.dart';
import 'package:injector/features/home/data/model/contact_model.dart';
import 'package:injector/features/home/presentation/bloc/home_bloc.dart';
import 'package:injector/features/home/presentation/bloc/home_event.dart';

class AddEditContactCustomDialog extends StatefulWidget {
  final HomeBloc bloc;
  final bool edit;
  final ContactModel? model;
  final int? index;

  const AddEditContactCustomDialog({
    required this.bloc,
    required this.edit,
    required this.model,
    required this.index,
    super.key,
  });

  @override
  State<AddEditContactCustomDialog> createState() =>
      _AddEditContactCustomDialogState();
}

class _AddEditContactCustomDialogState
    extends State<AddEditContactCustomDialog> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    widget.edit == true
        ? nameController = TextEditingController(text: widget.model!.name)
        : nameController = TextEditingController();

    widget.edit == true
        ? emailController = TextEditingController(text: widget.model!.email)
        : emailController = TextEditingController();

    widget.edit == true
        ? phoneController = TextEditingController(text: widget.model!.phone)
        : phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar')),
        widget.edit == false
            ? ElevatedButton(
                onPressed: () => widget.bloc.dispatchEvent(HomeEventAddContact(
                    paramets: ContactParamets(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                    ),
                    context: context)),
                child: const Text('Adicionar'))
            : ElevatedButton(
                onPressed: () => widget.bloc.dispatchEvent(HomeEventEditContact(
                    EditContactParameters(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        id: widget.model!.id,
                        index: widget.index!,
                        context: context))),
                child: const Text('Editar'))
      ],
    );
  }
}
