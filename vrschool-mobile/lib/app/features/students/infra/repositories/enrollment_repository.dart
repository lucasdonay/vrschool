import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/students/external/enrollment_service.dart';
import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_enrollment_request.dart';

class EnrollmentRepository {
  final EnrolllmentService enrolllmentService;

  EnrollmentRepository({required this.enrolllmentService});

  AsyncResult<bool, DioException> add(
      AddEnrollmentRequest addEnrollmentRequest) async {
    try {
      bool response = await enrolllmentService.add(addEnrollmentRequest);
      return Success(response);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<bool, DioException> delete(
      AddEnrollmentRequest addEnrollmentRequest) async {
    try {
      bool response = await enrolllmentService.delete(addEnrollmentRequest);
      return Success(response);
    } catch (e) {
      print(e);
      return Failure(e as DioException);
    }
  }
}
