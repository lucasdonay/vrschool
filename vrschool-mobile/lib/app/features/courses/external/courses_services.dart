import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/update_course_request.dart';

import '../../../config/client.dart';
import '../infra/models/add_course_request.dart';

class CoursesServices {
  final Dio dio = Client().init();

  Future<CoursesResponse> add(AddCourseRequest addAlunoRequest) async {
    try {
      final response =
          await dio.post('/cursos', queryParameters: addAlunoRequest.toJson());
      final addCourseReponse = CoursesResponse.fromMap(response.data);
      return addCourseReponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          // Acessar o corpo da resposta do backend
          print("Erro no backend - Status Code: ${e.response?.statusCode}");
          print("Corpo da Resposta: ${e.response?.data}");
        } else {
          // Caso não haja uma resposta do backend
          print("Erro de conexão: ${e.message}");
        }
      }
      rethrow;
    }
  }

  Future<CoursesResponse> update(UpdateCourseRequest updateCursoRequest) async {
    try {
      final response = await dio.put('/cursos/${updateCursoRequest.codigo}',
          queryParameters: updateCursoRequest.toJson());
      final addCourseReponse = CoursesResponse.fromMap(response.data);
      return addCourseReponse;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          // Acessar o corpo da resposta do backend
          print("Erro no backend - Status Code: ${e.response?.statusCode}");
          print("Corpo da Resposta: ${e.response?.data}");
        } else {
          // Caso não haja uma resposta do backend
          print("Erro de conexão: ${e.message}");
        }
      }
      rethrow;
    }
  }

  Future<List<CoursesResponse>> getAll() async {
    try {
      final response = await dio.get('/cursos');
      List<CoursesResponse> coursesListResponse = [];

      for (int i = 0; i < response.data.length; i++) {
        coursesListResponse.add(CoursesResponse.fromMap(response.data[i]));
      }
      return coursesListResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> delete(int codigo) async {
    try {
      final response = await dio.delete('/cursos/$codigo');
      print(response);
      return true;
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          // Acessar o corpo da resposta do backend
          print("Erro no backend - Status Code: ${e.response?.statusCode}");
          print("Corpo da Resposta: ${e.response?.data}");
        } else {
          // Caso não haja uma resposta do backend
          print("Erro de conexão: ${e.message}");
        }
      }
      rethrow;
    }
  }
}
