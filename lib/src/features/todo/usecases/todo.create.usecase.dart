import 'package:archtype/src/core/api/api_client_interface.dart';
import 'package:archtype/src/features/todo/models/todo.model.dart';
import 'package:archtype/src/features/todo/usecases/usecases.interfaces.dart';
import 'package:either_dart/either.dart';

class TodoCreateUsecase implements ITodoCreateUsecase {
  final IApiClient client;
  TodoCreateUsecase({required this.client});

  @override
  Future<Either<Exception, TodoModel>> exec(TodoModel todo) async {
    try {
      final response = await client.post(
        url: '/todos',
        body: todo.toMap(),
        mockResponse: todo.toMap(),
      );
      return Right(TodoModel.fromMap(response));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  } 
}