// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_enrollment_request.dart';

import '../../../config/client.dart';

class EnrolllmentService {
  final Dio dio = Client().init();

  Future<bool> add(AddEnrollmentRequest addEnrollmentRequest) async {
    try {
      final response = await dio.post('/curso-aluno',
          queryParameters: addEnrollmentRequest.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> delete(AddEnrollmentRequest addEnrollmentRequest) async {
    try {
      final response = await dio.delete('/curso-aluno/excluir-associacao',
          queryParameters: addEnrollmentRequest.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
