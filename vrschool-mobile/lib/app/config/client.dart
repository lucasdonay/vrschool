import "package:dio/dio.dart";

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = "http://localhost/vrschool-api";
    _dio.options.sendTimeout = Duration(milliseconds: 60000);
    _dio.options.connectTimeout = Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = Duration(milliseconds: 60000);
    return _dio;
  }
}
