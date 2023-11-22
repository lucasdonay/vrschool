import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/features/home/pages/home_page.dart';
import 'package:vrschool_mobile/app/features/navigation/navigation_pages.dart';
import 'package:vrschool_mobile/app/features/splash_screen/splash_screen_page.dart';

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
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.child('/home', child: (context) => const HomePage());
    r.child('/base', child: (context) => const NavigationPages());
  }
}
