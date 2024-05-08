import 'package:archtype/src/core/api/api_client_dio.dart';
import 'package:archtype/src/core/api/api_client_interface.dart';
import 'package:archtype/src/features/usecases/create.todo.usecase.dart';
import 'package:archtype/src/features/usecases/usecases.interfaces.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
class TodoBindings  {

  void dependencies() {
     getIt.registerSingleton<Dio>(Dio());
     getIt.registerSingleton<IApiClient>(ApiClientDio(client: getIt<Dio>()));
     getIt.registerSingleton<ICreateTodoUsecase>(CreateTodoUsecase(client: getIt<IApiClient>()));
  }
}