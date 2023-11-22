import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/update_course_request.dart';

import '../../../config/client.dart';
import '../infra/models/add_course_request.dart';

class CoursesServices {
  final Dio dio = Client().init();

  Future<CoursesResponse> add(AddCourseRequest addCourseRequest) async {
    try {
      final response =
          await dio.post('/cursos', data: jsonEncode(addCourseRequest));
      final addCourseResponse = CoursesResponse.fromMap(response.data);
      return addCourseResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<CoursesResponse> update(UpdateCourseRequest updateAlunoRequest) async {
    try {
      final response = await dio.put('/cursos/${updateAlunoRequest.codigo}',
          data: jsonEncode(updateAlunoRequest));
      final addCourseReponse = CoursesResponse.fromMap(response.data);
      return addCourseReponse;
    } catch (e) {
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
      print("ERRROR: ${e}");
      rethrow;
    }
  }

  Future<void> remove(String codigo) async {
    try {
      final response = await dio.delete('/cursos/$codigo');
    } catch (e) {
      rethrow;
    }
  }
}
