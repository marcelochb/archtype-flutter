import 'package:archtype/src/core/api/api_client_interface.dart';
import 'package:archtype/src/features/infra/models/todo.model.dart';
import 'package:archtype/src/features/usecases/usecases.interfaces.dart';
import 'package:either_dart/either.dart';

class CreateTodoUsecase implements ICreateTodoUsecase {
  final IApiClient client;
  CreateTodoUsecase({required this.client});

  @override
  Future<Either<Exception, TodoModel>> call(TodoModel todo) async {
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