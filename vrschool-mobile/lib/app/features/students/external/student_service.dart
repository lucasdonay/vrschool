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

  Future<AlunoResponse> update(UpdateAlunoRequest updateAlunoRequest) async {
    try {
      final response = await dio.put('/alunos/${updateAlunoRequest.id}',
          data: jsonEncode(updateAlunoRequest));
      final addAlunoResponse = AlunoResponse.fromMap(response.data);
      return addAlunoResponse;
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

  Future<List<AlunoResponse>> getAll() async {
    try {
      final response = await dio.get('/alunos');
      List<AlunoResponse> alunoListResponse = [];

      for (int i = 0; i < response.data.length; i++) {
        alunoListResponse.add(AlunoResponse.fromMap(response.data[i]));
      }
      return alunoListResponse;
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

  Future<AlunoResponse> delete(int codigo) async {
    try {
      final response = await dio.delete('/alunos/$codigo');
      final addAlunoResponse = AlunoResponse.fromMap(response.data);
      return addAlunoResponse;
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
