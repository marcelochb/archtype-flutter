import 'package:archtype/src/features/todo/binds/todo.bindings.dart';
import 'package:archtype/src/features/todo/presenter/list/pages/todo.list.page.dart';
import 'package:archtype/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  TodoBindings().setup();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.getRouter(),
    );
  }
}