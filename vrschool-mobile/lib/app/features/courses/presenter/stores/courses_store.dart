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
  ObservableList<CoursesResponse> coursesList = ObservableList<CoursesResponse>();

  @observable
  bool isLoading = false;

  @action
  setCourseList(List<CoursesResponse> courses) {
    coursesList.clear();

    for (int i = 0; i < courses.length; i++) {
     
      coursesList.add(courses[i]);
    }

    print(coursesList);
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
  Future<void> add(AddCourseRequest addCourseRequest) async {
    isLoading = true;
    try {
      await repository.add(addCourseRequest).onSuccess((success) {
        addNewCourseInList(success);
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
        updateCourseInList(success);
        print(coursesList);
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
        print("DEU BOM");
        setCourseList(success);
      }).onFailure((failure) {
        print("DEU RUIM");
        throw failure;
      });
    } finally {
      isLoading = false;
    }
  }

}