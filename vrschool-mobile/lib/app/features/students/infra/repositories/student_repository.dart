import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/students/external/student_service.dart';
import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_student_request.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/update_student_request.dart';

class AlunoRepository {
  final AlunosService alunosService;

  AlunoRepository({required this.alunosService});

  AsyncResult<AlunoResponse, DioException> add(
      AddAlunoRequest addAlunoRequest) async {
    try {
      AlunoResponse alunoResponse = await alunosService.add(addAlunoRequest);
      return Success(alunoResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<AlunoResponse, DioException> update(
      UpdateAlunoRequest updateAlunoRequest) async {
    try {
      AlunoResponse alunoResponse =
          await alunosService.update(updateAlunoRequest);
      return Success(alunoResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<List<AlunoResponse>, DioException> getAll() async {
    try {
      List<AlunoResponse> alunoListResponse = await alunosService.getAll();
      return Success(alunoListResponse);
    } catch (e) {
      print("DEU ERRO");
      return Failure(e as DioException);
    }
  }

  AsyncResult<AlunoResponse, DioException> deleteById(int codigo) async {
    try {
      AlunoResponse alunoResponse = await alunosService.delete(codigo);
      return Success(alunoResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }
}
