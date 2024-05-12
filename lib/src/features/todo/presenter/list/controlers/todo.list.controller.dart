import 'package:archtype/src/features/todo/models/todo.model.dart';
import 'package:archtype/src/features/todo/usecases/usecases.interfaces.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'todo.list.controller.g.dart';


@riverpod
class TodoListController extends _$TodoListController {
late ITodoGetListUsecase _usecase;
  @override
  Future<List<TodoModel>> build() async {

   _usecase = GetIt.I.get<ITodoGetListUsecase>();
    return getList();
  }


  Future<List<TodoModel>> getList() async {
    final result = await _usecase.exec();
    final state = <TodoModel>[];
    result.fold(
      (errors) {
        throw Exception(errors);
      },
      (data) {
        state.addAll(data);
      },
    );
    return state;
  }
}