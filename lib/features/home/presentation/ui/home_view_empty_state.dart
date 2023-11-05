import 'package:flutter/material.dart';

class HomeViewEmptyState extends StatefulWidget {
  const HomeViewEmptyState({super.key});

  @override
  State<HomeViewEmptyState> createState() => _HomeViewEmptyStateState();
}

class _HomeViewEmptyStateState extends State<HomeViewEmptyState> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Lista vazía'),
    );
  }
}