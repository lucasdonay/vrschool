import "package:dio/dio.dart";

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl =
        "https://03ad-2804-1e68-c609-8d22-b007-b2f7-abf3-bcc6.ngrok-free.app/vrschool-api";
    _dio.options.sendTimeout = Duration(milliseconds: 60000);
    _dio.options.connectTimeout = Duration(milliseconds: 40000);
    _dio.options.receiveTimeout = Duration(milliseconds: 60000);
    return _dio;
  }
}
