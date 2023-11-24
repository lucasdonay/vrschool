import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/features/students/presenter/widgets/custom_tile_students.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';

import '../../../../core/ui/vrschool_ui.dart';
import '../stores/student_store.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  final controller = Modular.get<AlunosStore>();
  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  String curNameSearch = "";

  @override
  void initState() {
    setState(() {
      curNameSearch = "";
    });

    controller.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getAll();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              children: [
                _buildSearch(),
                SizedBox(
                  height: 10,
                ),
                Observer(builder: (context) {
                  return controller.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _buildList();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pesquisar Alunos',
              style: isDarkMode
                  ? VrSchoolUi.headline1DarkMode
                  : VrSchoolUi.headline1,
            ),
            FloatingActionButton(
              onPressed: () {
                Modular.to.pushNamed('/student/addOrEdit');
              },
              backgroundColor: VrColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    50.0), // Define a forma como um círculo
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        controller.alunoList.length > 0
            ? TextField(
                onChanged: (value) {
                  setState(() {
                    curNameSearch = value;
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: VrColors.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: VrColors.white,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isDarkMode ? VrColors.white : VrColors.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Digite o nome do aluno aqui...',
                  hintStyle: isDarkMode
                      ? VrSchoolUi.headline3DarkMode
                      : VrSchoolUi.headline3,
                  labelStyle: isDarkMode
                      ? VrSchoolUi.headline3DarkMode
                      : VrSchoolUi.headline3,
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: VrColors.primary,
                ),
                cursorColor: isDarkMode ? VrColors.white : VrColors.primary, //
              )
            : Container()
      ],
    );
  }

  _buildList() {
    return Observer(builder: (context) {
      if (controller.alunoList.isEmpty) {
        return Column(
          children: [
            const SizedBox(
              height: 50,
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
              height: 40,
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
              itemCount: controller.alunoList.length,
              itemBuilder: (_, index) {
                int id = controller.alunoList[index].codigo;
                String studentName =
                    controller.alunoList[index].nome.toUpperCase();

                String studentCourse =
                    controller.alunoList[index].cursoDescricao.toUpperCase();

                if (studentCourse == '') {
                  studentCourse = "NÃO ESTÁ MATRICULADO";
                } else {
                  studentCourse =
                      controller.alunoList[index].cursoDescricao.toUpperCase();
                }

                if (studentName.toLowerCase().contains(
                      curNameSearch.toLowerCase(),
                    )) {
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
                      await controller
                          .delete(id)
                          .whenComplete(() => Modular.to.pop());

                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: 'Aluno deletado!',
                        confirmBtnText: 'OK',
                        confirmBtnColor: VrColors.lightContainer,
                        confirmBtnTextStyle: TextStyle(fontSize: 15),
                      );
                    },
                  );
                }
                return null;
              },
            );
          }),
        );
      }
    });
  }
}
