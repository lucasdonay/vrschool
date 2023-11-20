import "package:dio/dio.dart";

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = "";
    _dio.options.sendTimeout = 60000;
    _dio.options.connectTimeout = 30000;
    _dio.options.receiveTimeout = 60000;
    return _dio;
  }
}
