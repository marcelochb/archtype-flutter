import 'package:archtype/src/core/interfaces/get.controller.interface.dart';
import 'package:archtype/src/features/todo/presenter/list/controlers/todo.list.controller.signal.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:signals_flutter/signals_flutter.dart';


class TodoListPageSignal extends IGetController<TodoListControllerSignal> {
  const TodoListPageSignal({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Center(
        child: Watch(
          (_) {
            return controller.loading.value ? const CircularProgressIndicator() : ListView.builder(
              itemCount: controller.data.value.length,
              itemBuilder: (context, index) {
                final todo = controller.data.value[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                );
              },
            );
          },
        ),
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