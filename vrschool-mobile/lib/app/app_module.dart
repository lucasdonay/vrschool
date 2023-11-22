import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/features/courses/external/courses_services.dart';
import 'package:vrschool_mobile/app/features/courses/infra/repositories/courses_repository.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/pages/add_course_page.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import 'package:vrschool_mobile/app/features/home/pages/home_page.dart';
import 'package:vrschool_mobile/app/features/navigation/navigation_pages.dart';
import 'package:vrschool_mobile/app/features/splash_screen/splash_screen_page.dart';
import 'package:vrschool_mobile/app/features/students/presenter/pages/add_student_page.dart';
import 'package:vrschool_mobile/app/features/students/presenter/pages/student_info_page.dart';

import 'features/courses/presenter/pages/individual_course.dart';
import 'features/students/external/student_service.dart';
import 'features/students/infra/repositories/student_repository.dart';
import 'features/students/presenter/stores/student_store.dart';

class AppModule extends Module {
  @override
  @override
  void binds(i) {
    i.add(AlunosService.new);
    i.add(AlunoRepository.new);
    i.addSingleton(AlunosStore.new);

    i.add(CoursesServices.new);
    i.add(CoursesRepository.new);
    i.addSingleton(CoursesStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.child('/home', child: (context) => const HomePage());
    r.child('/base', child: (context) => const NavigationPages());

    r.child('/student/info', child: (context) => const AlunoIndividual());
    r.child('/student/add', child: (context) => const AddStudentPage());

    r.child('/course/info', child: (context) => const CursoIndividual());
    r.child('/course/add', child: (context) => const AddCoursePage());
  }
}
