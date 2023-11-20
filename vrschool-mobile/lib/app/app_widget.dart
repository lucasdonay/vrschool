import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';
import 'package:vrschool_mobile/app/features/alunos/presenter/pages/alunos_page.dart';
import 'package:vrschool_mobile/app/features/cursos/presenter/pages/cursos_page.dart';

import 'features/alunos/presenter/pages/aluno_individual.dart';
import 'features/cursos/presenter/pages/curso_individual.dart';
import 'features/home/pages/home_page.dart';
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
      routes: {
        '/home': (context) => const HomePage(),
        '/cursos': (context) => const CursosPage(),
        '/alunos': (context) => const AlunosPage(),
        '/curso-individual': (context) => CursoIndividual(),
        '/aluno-individual': (context) => AlunoIndividual(),
      },
    );
  }
}
