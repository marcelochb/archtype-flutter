import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodoCreatePage extends StatelessWidget {
const TodoCreatePage({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: const Center(
        child: Text('Create Todo Page'),
      ),
      );
  }
}