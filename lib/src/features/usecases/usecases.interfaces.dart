import 'package:archtype/src/features/infra/models/todo.model.dart';
import 'package:either_dart/either.dart';

abstract class ICreateTodoUsecase {
  Future<Either<Exception, TodoModel>> call(TodoModel todo);
}