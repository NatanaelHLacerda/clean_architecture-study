import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injector/core/architecture/bloc/bloc_state.dart';
import 'package:injector/features/home/presentation/bloc/home_bloc.dart';
import 'package:injector/features/home/presentation/bloc/home_event.dart';
import 'package:injector/features/home/presentation/ui/home_view_empty_state.dart';
import 'package:injector/features/home/presentation/ui/home_view_stable_state.dart';
import 'package:injector/features/home/presentation/widgets/add_edit_contact_custom_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    bloc.dispatchEvent(HomeEventGetContacts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () =>
                  bloc.dispatchEvent(HomeEventSignOut(context: context)),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder(
          stream: bloc.state,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data is BlocStableState) {
                return HomeViewStableState(
                  listContacts: snapshot.data!.data,
                  bloc: bloc,
                );
              } else if (snapshot.data is BlocEmptyState) {
                return const HomeViewEmptyState();
              }
            }
            return Container();
          })),
      floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.dispatchEvent(HomeEventShowDialog(
              context: context,
              dialog: AddEditContactCustomDialog(
                edit: false,
                bloc: bloc,
                model: null,
                index: null,
              )))),
    );
  }
}
