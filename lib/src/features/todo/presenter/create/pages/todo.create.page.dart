import 'package:flutter/material.dart';

class TodoCreatePage extends StatelessWidget {
const TodoCreatePage({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: const Center(
        child: Text('Create Todo Page'),
      ),
      );
  }
}