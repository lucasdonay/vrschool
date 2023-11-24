// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/add_course_request.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/update_course_request.dart';
import 'package:vrschool_mobile/app/features/courses/infra/repositories/courses_repository.dart';
part 'courses_store.g.dart';

class CoursesStore = _CoursesStore with _$CoursesStore;

abstract class _CoursesStore with Store {
  final CoursesRepository repository;

  _CoursesStore(this.repository);

  @observable
  ObservableList<CoursesResponse> coursesList =
      ObservableList<CoursesResponse>();

  @observable
  bool isLoading = false;

  @action
  setCourseList(List<CoursesResponse> courses) {
    coursesList.clear();

    for (int i = 0; i < courses.length; i++) {
      coursesList.add(courses[i]);
    }
  }

  @action
  addNewCourseInList(CoursesResponse courseResponse) {
    coursesList.add(courseResponse);

    print(coursesList);
  }

  @action
  updateCourseInList(CoursesResponse courseResponse) {
    for (int i = 0; i < coursesList.length; i++) {
      if (coursesList[i].codigo == courseResponse.codigo) {
        coursesList[i].descricao = courseResponse.descricao;
        break;
      }
    }
  }

  @action
  removeCourseInList(int id) {
    for (int i = 0; i < coursesList.length; i++) {
      if (coursesList[i].codigo == id) {
        coursesList.remove(coursesList[i]);
        break;
      }
    }
  }

  @action
  Future<void> add(AddCourseRequest addCourseRequest) async {
    isLoading = true;
    try {
      await repository.add(addCourseRequest).onSuccess((success) async {
        await getAll();
      }).onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> update(UpdateCourseRequest updateCourseRequest) async {
    isLoading = true;
    try {
      await repository.update(updateCourseRequest).onSuccess((success) {
        updateCourseInList(CoursesResponse(
            codigo: updateCourseRequest.codigo,
            descricao: updateCourseRequest.descricao,
            ementa: updateCourseRequest.ementa,
            enrollmentsExist: updateCourseRequest.enrollmentsExist ?? false));
      }).onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getAll() async {
    isLoading = true;
    try {
      await repository.getAll().onSuccess((success) {
        setCourseList(success);
      }).onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> delete(int id) async {
    isLoading = true;
    try {
      await repository.deleteById(id).onSuccess((success) {
        removeCourseInList(id);
      }).onFailure((failure) {
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }
}
