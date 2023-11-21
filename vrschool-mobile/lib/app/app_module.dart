import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/features/home/pages/home_page.dart';
import 'package:vrschool_mobile/app/features/navigation/navigation_pages.dart';
import 'package:vrschool_mobile/app/features/splash_screen/splash_screen_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    super.binds(i);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreen());
    r.child('/home', child: (context) => const HomePage());
    r.child('/base', child: (context) => const NavigationPages());
  }
}
