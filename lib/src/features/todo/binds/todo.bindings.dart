import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../core/_exports.dart';
import '../usecases/_exports.dart';

class TodoBindings  {

  void setup() {
     GetIt.I.registerSingleton<Dio>(Dio());
     GetIt.I.registerSingleton<IApiClient>(ApiClientDio(client: GetIt.I<Dio>(), isMockResponse: true));
     GetIt.I.registerSingleton<ITodoCreateUsecase>(TodoCreateUsecase(client: GetIt.I<IApiClient>()));
     GetIt.I.registerSingleton<ITodoGetListUsecase>(TodoGetListUsecase(client: GetIt.I<IApiClient>()));
  }
}