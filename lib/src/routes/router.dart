import 'package:archtype/src/features/todo/presenter/create/pages/todo.create.page.dart';
import 'package:archtype/src/features/todo/presenter/list/pages/todo.list.page.dart';
import 'package:archtype/src/features/todo/presenter/list/pages/todo.list.page.signal.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter getRouter() {
    return GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const TodoListPageSignal(),
        ),
        GoRoute(
          path: '/create',
          builder: (context, state) => const TodoCreatePage(),
          ),
      ],
    );
  }
}