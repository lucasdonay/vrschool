import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';

import 'home_page.dart';
import 'features/splash_screen/splash_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: VrSchoolUi.theme.textTheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme:
            const ColorScheme.light().copyWith(primary: Colors.deepOrange),
      ),
      home: const SplashScreen(),
      routes: {'/home': (context) => const HomePage()},
    );
  }
}
