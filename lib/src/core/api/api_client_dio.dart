
import 'package:archtype/src/core/api/api_client_interface.dart';
import 'package:dio/dio.dart';

class ApiClientDio implements IApiClient {
  final Dio client;
  final bool isMockResponse;
  String baseUrl = 'http://localhost:3000';
  ApiClientDio({required this.client, required this.isMockResponse});

  @override
  Future delete(String url, {Map<String, dynamic>? body}) async {
    try {
      return await client.delete('$baseUrl/$url', data: body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future get({
    required String url, 
    required List<Map<String, dynamic>> mockResponse,
    Map<String, dynamic>? queryParameters
  }) async {
    try {
      if (isMockResponse){
        await Future<void>.delayed(const Duration(seconds: 2));
         return mockResponse;
         };
      return await client.get('$baseUrl/$url',
          queryParameters: queryParameters);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future post({
    required String url,
    required Map<String, dynamic> body,
    required Map<String,dynamic> mockResponse
    }) async {
    try {
      if (isMockResponse) return mockResponse;
      return await client.post('$baseUrl/$url', data: body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future put(String url, {Map<String, dynamic>? body}) async {
    try {
      return await client.put('$baseUrl/$url', data: body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
