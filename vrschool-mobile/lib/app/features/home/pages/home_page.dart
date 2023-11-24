import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';
import 'package:vrschool_mobile/app/features/students/presenter/stores/student_store.dart';

import '../../courses/infra/models/courses_response.dart';
import '../../courses/presenter/stores/courses_store.dart';
import '../../courses/presenter/widgets/custom_tile_courses.dart';
import '../../students/infra/models/student_response.dart';
import '../../students/presenter/widgets/custom_tile_students.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerStudent = Modular.get<AlunosStore>();
  final controllerCourse = Modular.get<CoursesStore>();

  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  String? existOrNot;

  @override
  void initState() {
    controllerStudent.getAll();
    controllerCourse.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text(
                  'Alunos',
                  style: isDarkMode
                      ? VrSchoolUi.headline1DarkMode
                      : VrSchoolUi.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.32,
                  child: _buildListAlunos(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Cursos',
                  style: isDarkMode
                      ? VrSchoolUi.headline1DarkMode
                      : VrSchoolUi.headline1,
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.41,
                  child: _buildListCourse(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  _buildListCourse() {
    return Observer(builder: (context) {
      if (controllerCourse.coursesList.isEmpty) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/noCourse.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Não exite cursos cadastrados, cadastre um no botão abaixo',
              maxLines: 2,
              style: VrSchoolUi.headline3,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/course/addOrEdit');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green,
                ), // Cor de fundo
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Raio da borda
                  ),
                ),
              ),
              child: Text(
                'Adicionar curso',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: controllerCourse.coursesList.length,
            itemBuilder: (_, index) {
              int id = controllerCourse.coursesList[index].codigo;
              String courseName =
                  controllerCourse.coursesList[index].descricao.toUpperCase();
              String courseEmenta =
                  controllerCourse.coursesList[index].ementa.toUpperCase();

              bool enrollmentsExist =
                  controllerCourse.coursesList[index].enrollmentsExist;

              if (enrollmentsExist) {
                existOrNot = 'Sim';
              } else {
                existOrNot = 'Não';
              }

              return CustomTileCourses(
                id: id,
                name: courseName,
                subtitle: courseEmenta,
                enrollmentsExist: existOrNot.toString(),
                edit: () {
                  Modular.to.pushNamed(
                    '/course/addOrEdit',
                    arguments: CoursesResponse(
                      codigo: id,
                      descricao: courseName,
                      ementa: courseEmenta,
                      enrollmentsExist: enrollmentsExist,
                    ),
                  );
                },
                delete: () {
                  controllerCourse.delete(id);

                  Modular.to.pop();
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    title: 'Curso deletado!',
                    confirmBtnText: 'OK',
                    confirmBtnColor: VrColors.primary,
                    confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                  );
                },
              );
            },
          ),
        );
      }
    });
  }

  _buildListAlunos() {
    return Observer(builder: (context) {
      if (controllerStudent.alunoList.isEmpty) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/group.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Não exite alunos cadastrados, cadastre um no botão abaixo',
              maxLines: 2,
              style: VrSchoolUi.headline3,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/student/addOrEdit');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green,
                ), // Cor de fundo
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Raio da borda
                  ),
                ),
              ),
              child: Text(
                'Adicionar Aluno',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return Expanded(
          child: Observer(builder: (context) {
            return ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: controllerStudent.alunoList.length,
              itemBuilder: (_, index) {
                int id = controllerStudent.alunoList[index].codigo;
                String studentName =
                    controllerStudent.alunoList[index].nome.toUpperCase();

                String studentCourse = controllerStudent
                    .alunoList[index].cursoDescricao
                    .toUpperCase();

                if (studentCourse == '') {
                  studentCourse = "NÃO ESTÁ MATRICULADO";
                } else {
                  studentCourse = controllerStudent
                      .alunoList[index].cursoDescricao
                      .toUpperCase();
                }

                return CustomTileStudents(
                  id: id,
                  name: studentName,
                  subtitle: studentCourse,
                  edit: () {
                    Modular.to.pushNamed(
                      '/student/addOrEdit',
                      arguments: AlunoResponse(
                          codigo: id,
                          nome: studentName,
                          cursoDescricao: studentCourse),
                    );
                  },
                  delete: () async {
                    controllerStudent.delete(id);
                    Modular.to.pop();
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: 'Aluno deletado!',
                      confirmBtnText: 'OK',
                      confirmBtnColor: VrColors.primary,
                      confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                    );
                  },
                );
              },
            );
          }),
        );
      }
    });
  }
}
