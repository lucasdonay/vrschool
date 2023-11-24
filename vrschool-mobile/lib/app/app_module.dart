import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/components/navigation/navigation_controller.dart';
import 'package:vrschool_mobile/app/features/courses/external/courses_services.dart';
import 'package:vrschool_mobile/app/features/courses/infra/repositories/courses_repository.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import 'package:vrschool_mobile/app/features/home/pages/home_page.dart';
import 'package:vrschool_mobile/app/components/pages_base/splash_screen_page.dart';
import 'package:vrschool_mobile/app/features/students/external/enrollment_service.dart';
import 'package:vrschool_mobile/app/features/students/infra/repositories/enrollment_repository.dart';
import 'package:vrschool_mobile/app/features/students/presenter/pages/add_or_edit_student_page.dart';

import 'package:vrschool_mobile/app/features/students/presenter/stores/enrollment_store.dart';

import 'components/navigation/navigation_pages.dart';
import 'features/courses/presenter/pages/add_or_edit_course_page.dart';

import 'features/students/external/student_service.dart';
import 'features/students/infra/repositories/student_repository.dart';
import 'features/students/presenter/stores/student_store.dart';

class AppModule extends Module {
  @override
  @override
  void binds(i) {
    i.add(EnrolllmentService.new);
    i.add(EnrollmentRepository.new);
    i.addSingleton(EnrollmentStore.new);

    i.add(AlunosService.new);
    i.add(AlunoRepository.new);
    i.addSingleton(AlunosStore.new);

    i.add(CoursesServices.new);
    i.add(CoursesRepository.new);
    i.addSingleton(CoursesStore.new);

    i.addSingleton(NavigationController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.child('/home', child: (context) => const HomePage());
    r.child('/base', child: (context) => const NavigationPages());

    r.child(
      '/student/addOrEdit',
      child: (context) => AddOrEditStudentPage(
        student: r.args.data,
      ),
    );

    r.child(
      '/course/addOrEdit',
      child: (context) => AddOrEditCoursePage(
        course: r.args.data,
      ),
    );
  }
}
