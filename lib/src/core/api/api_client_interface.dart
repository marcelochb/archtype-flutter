abstract class IApiClient {
  Future get(String url, {Map<String, dynamic>? queryParameters});
  Future post({
    required String url, 
    required Map<String, dynamic> body, 
    required Map<String, dynamic> mockResponse,
  });
  Future put(String url, {Map<String, dynamic>? body});
  Future delete(String url, {Map<String, dynamic>? body});
  bool get isMocked;
}
