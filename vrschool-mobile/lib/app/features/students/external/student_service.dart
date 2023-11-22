import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/update_student_request.dart';

import '../../../config/client.dart';
import '../infra/models/add_student_request.dart';

class AlunosService {
  final Dio dio = Client().init();

  Future<AlunoResponse> add(AddAlunoRequest addAlunoRequest) async {
    try {
      final response =
          await dio.post('/alunos', data: jsonEncode(addAlunoRequest));
      final addAlunoResponse = AlunoResponse.fromMap(response.data);
      return addAlunoResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<AlunoResponse> update(UpdateAlunoRequest updateAlunoRequest) async {
    try {
      final response = await dio.put('/alunos/${updateAlunoRequest.id}',
          data: jsonEncode(updateAlunoRequest));
      final addAlunoResponse = AlunoResponse.fromMap(response.data);
      return addAlunoResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AlunoResponse>> getAll() async {
    try {
      final response = await dio.get('/alunos');
      List<AlunoResponse> alunoListResponse = [];

      for(int i = 0; i < response.data.length; i++) {
        alunoListResponse.add(AlunoResponse.fromMap(response.data[i]));
      }
      return alunoListResponse;
    } catch (e) {
      print("ERRROR BERNA: ${e}");
      rethrow;
    }
  }

  Future<void> remove(String id) async {
    try {
      final response = await dio.delete('/alunos/$id');
    } catch (e) {
      rethrow;
    }
  }
}