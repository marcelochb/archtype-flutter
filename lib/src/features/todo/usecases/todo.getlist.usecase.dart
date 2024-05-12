import 'package:archtype/src/features/todo/models/todo.model.dart';
import 'package:archtype/src/features/todo/todo.mocks.dart';
import 'package:archtype/src/features/todo/usecases/usecases.interfaces.dart';
import 'package:either_dart/either.dart';

import '../../../core/_exports.dart';

class TodoGetListUsecase implements ITodoGetListUsecase {
  final IApiClient client;
  TodoGetListUsecase({required this.client});

  @override
  Future<Either<Exception, List<TodoModel>>> exec() async {
    try {
      final response = await client.get(
        url: '/todos',
        mockResponse: todoListMock,
      );
      return Right((response as List).map((e) => TodoModel.fromMap(e)).toList());
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
