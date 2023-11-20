import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';

import '../widgets/cards_aluno.dart';
import '../widgets/cards_cursos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Alunos',
                        style: VrSchoolUi.headline1,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardsAluno(),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Cursos',
                        style: VrSchoolUi.headline1,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CardsCursos(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
