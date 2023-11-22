import "package:dio/dio.dart";

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = "http://192.168.100.2:8083/vrschool-api";
    _dio.options.sendTimeout = Duration(milliseconds: 60000);
    _dio.options.connectTimeout = Duration(milliseconds: 30000);
    _dio.options.receiveTimeout = Duration(milliseconds: 60000);
    return _dio;
  }
}
