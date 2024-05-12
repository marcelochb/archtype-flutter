import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controlers/todo.list.controller.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(todoListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Center(
        child: switch (provider) {
          AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final todo = value[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
              );
            },
          ),
          AsyncError(:final error) => Center(child: Text('Error: $error')),
          _ => const Center(child: CircularProgressIndicator()),
        },
      ), 
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/create');
        },
        child: const Icon(Icons.add),
      )
    );
  }
}