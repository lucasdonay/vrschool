import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/courses/external/courses_services.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/add_course_request.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:dio/dio.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/update_course_request.dart';

class CoursesRepository {
  final CoursesServices coursesServices;

  CoursesRepository({required this.coursesServices});

  AsyncResult<CoursesResponse, DioException> add(
      AddCourseRequest addCourseRequest) async {
    try {
      CoursesResponse courseResponse =
          await coursesServices.add(addCourseRequest);
      return Success(courseResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<CoursesResponse, DioException> update(
      UpdateCourseRequest updateCourseRequest) async {
    try {
      CoursesResponse coursesResponse =
          await coursesServices.update(updateCourseRequest);
      return Success(coursesResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<List<CoursesResponse>, DioException> getAll() async {
    try {
      List<CoursesResponse> coursesListResponse =
          await coursesServices.getAll();
      return Success(coursesListResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }

  AsyncResult<bool, DioException> deleteById(int codigo) async {
    try {
      bool alunoResponse = await coursesServices.delete(codigo);
      return Success(alunoResponse);
    } catch (e) {
      return Failure(e as DioException);
    }
  }
}
