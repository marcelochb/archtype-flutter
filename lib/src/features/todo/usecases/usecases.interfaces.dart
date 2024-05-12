import 'package:archtype/src/features/todo/models/todo.model.dart';
import 'package:either_dart/either.dart';

abstract class ITodoCreateUsecase {
  Future<Either<Exception, TodoModel>> exec(TodoModel todo);
}

abstract class ITodoGetListUsecase {
  Future<Either<Exception, List<TodoModel>>> exec();
}