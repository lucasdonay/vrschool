import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';
import '../../students/presenter/widgets/cards_student.dart';
import '../../courses/presenter/widgets/cards_courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Text(
                'Alunos',
                style: VrSchoolUi.headline1,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: Observer(builder: (context) {
                  return CardsAluno();
                }),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Cursos',
                style: VrSchoolUi.headline1,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Observer(builder: (context) {
                  return CardsCursos();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
