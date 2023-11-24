import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';
import '../widgets/custom_tile_courses.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({super.key});

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  final controller = Modular.get<CoursesStore>();

  TextEditingController curSearch = TextEditingController();

  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  String curNameSearch = "";

  String? exist;

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
                Observer(builder: (context) {
                  return _buildSearch();
                }),
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
              'Pesquisar cursos',
              style: isDarkMode
                  ? VrSchoolUi.headline1DarkMode
                  : VrSchoolUi.headline1,
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  curNameSearch = "";
                });
                Modular.to.pushNamed('/course/addOrEdit');
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
        controller.coursesList.length > 0
            ? TextField(
                onChanged: (value) {
                  setState(() {
                    curNameSearch = value;
                  });
                },
                controller: curSearch,
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
                cursorColor: isDarkMode ? VrColors.white : VrColors.primary,
              )
            : Container()
      ],
    );
  }

  _buildList() {
    if (controller.coursesList.isEmpty) {
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
            height: 10,
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
          itemCount: controller.coursesList.length,
          itemBuilder: (_, index) {
            int id = controller.coursesList[index].codigo;
            String courseName =
                controller.coursesList[index].descricao.toUpperCase();
            String courseEmenta =
                controller.coursesList[index].ementa.toUpperCase();

            bool existMatricula =
                controller.coursesList[index].existsMatriculas;

            if (existMatricula) {
              exist = 'Sim';
            } else {
              exist = 'Não';
            }

            if (courseName
                .toLowerCase()
                .contains(curNameSearch.toLowerCase())) {
              return CustomTileCourses(
                id: id,
                name: courseName,
                subtitle: courseEmenta,
                existMatriculas: exist.toString(),
                edit: () {
                  Modular.to.pushNamed(
                    '/course/addOrEdit',
                    arguments: CoursesResponse(
                      codigo: id,
                      descricao: courseName,
                      ementa: courseEmenta,
                      existsMatriculas: existMatricula,
                    ),
                  );
                },
                delete: () {
                  controller.delete(id);

                  Modular.to.pop();
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    title: 'Curso deletado!',
                    confirmBtnText: 'OK',
                    confirmBtnColor: VrColors.primary,
                    confirmBtnTextStyle: TextStyle(fontSize: 15),
                  );
                },
              );
            }
            return null;
          },
        ),
      );
    }
  }
}
