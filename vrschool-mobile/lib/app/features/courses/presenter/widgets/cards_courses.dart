import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // Import the Observer widget
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';

class CardsCursos extends StatefulWidget {
  const CardsCursos({super.key});

  @override
  State<CardsCursos> createState() => _CardsCursosState();
}

class _CardsCursosState extends State<CardsCursos> {
  final controller = Modular.get<CoursesStore>();

  int? courses;

  @override
  void initState() {
    controller.getAll();
    controller.coursesList;
    courses = controller.coursesList.length;
    Future.delayed(Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    controller.coursesList;
    courses = controller.coursesList.length;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (courses! > 1) {
      return Observer(builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: controller.coursesList.length,
          itemBuilder: (_, index) {
            String courseDescricao =
                controller.coursesList[index].descricao.toUpperCase();
            String courseEmenta =
                controller.coursesList[index].ementa.toUpperCase();
            return Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: VrColors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NOME DO CURSO',
                                style: VrSchoolUi.headline2,
                              ),
                              Text(
                                courseDescricao,
                                overflow: TextOverflow.ellipsis,
                                style: VrSchoolUi.headline3,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'EMENTA DO CURSO',
                                style: VrSchoolUi.headline2,
                              ),
                              Text(
                                courseEmenta,
                                style: VrSchoolUi.headline3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 122, // Ajuste conforme necessário
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/course/info');
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 20,
                                color: VrColors.primary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.info,
                                  confirmBtnText: 'Sim',
                                  title:
                                      'Tem certeza que deseja deletar o curso ?',
                                  cancelBtnText: 'Não',
                                  showConfirmBtn: true,
                                  showCancelBtn: true,
                                  confirmBtnColor: VrColors.primary,
                                  cancelBtnTextStyle: TextStyle(
                                    color: VrColors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  onConfirmBtnTap: () {
                                    Navigator.pop(context);
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.success,
                                      title: 'Curso deletado!',
                                      confirmBtnText: 'OK',
                                      confirmBtnColor: VrColors.lightContainer,
                                      confirmBtnTextStyle:
                                          TextStyle(fontSize: 15),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                size: 20,
                                color: VrColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      });
    } else {
      return Column(
        children: [
          Text(
            'Não exite cursos cadastrados, cadastre um no botão abaixo',
          ),
          ElevatedButton(
            onPressed: () {
              Modular.to.navigate('/course/add');
            },
            child: Text('Adicionar CURSO'),
          ),
        ],
      );
    }
  }
}
