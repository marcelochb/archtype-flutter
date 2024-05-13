import 'package:archtype/src/features/todo/usecases/usecases.interfaces.dart';
import 'package:signals_flutter/signals_flutter.dart';

import '../../../models/todo.model.dart';

class TodoListControllerSignal{
  final ITodoGetListUsecase usecase;

  TodoListControllerSignal({required this.usecase}) {
    loadData();
  }

  final  data = signal(<TodoModel>[]);
  final  error = signal(false);
  final  loading = signal(true);

  Future<void> loadData() async {

    loading.value = true;
    final result = await usecase.exec();
    result.fold(
      (errors) {
        error.value = true;
      },
      (success) {
        data.value = success;
        loading.value = false;
      },
    );
  }
}