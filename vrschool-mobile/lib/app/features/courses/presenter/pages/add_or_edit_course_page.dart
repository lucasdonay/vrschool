import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/add_course_request.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/courses_response.dart';
import 'package:vrschool_mobile/app/features/courses/infra/models/update_course_request.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';
import '../stores/courses_store.dart';

class AddOrEditCoursePage extends StatefulWidget {
  final CoursesResponse? course;
  const AddOrEditCoursePage({super.key, this.course});

  @override
  State<AddOrEditCoursePage> createState() => _AddOrEditCoursePageState();
}

class _AddOrEditCoursePageState extends State<AddOrEditCoursePage> {
  final controller = Modular.get<CoursesStore>();

  TextEditingController descricao = TextEditingController();
  TextEditingController ementa = TextEditingController();

  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  @override
  void initState() {
    super.initState();
    if (widget.course != null) {
      descricao.text = widget.course!.descricao;
      ementa.text = widget.course!.ementa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.course != null ? 'Editar curso' : 'Criar curso',
                      style: isDarkMode
                            ? VrSchoolUi.headline1DarkMode
                            : VrSchoolUi.headline1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: descricao,
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
                            color: isDarkMode
                                ? VrColors.white
                                : const Color.fromARGB(255, 58, 58, 58),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Digite o nome do curso aqui...',
                        hintStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                        labelStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: ementa,
                      maxLines: 5,
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
                            color: isDarkMode
                                ? VrColors.white
                                : const Color.fromARGB(255, 58, 58, 58),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Digite a ementa aqui...',
                        hintStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                        labelStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    widget.course != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'OBSERVAÇÕES:',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Pra excluir o curso, não pode ter alunos cadastrados.',
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          )
                        : Container(),

                    const SizedBox(
                      height: 15,
                    ),
                    Observer(builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.course != null
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.red,
                                    ), // Cor de fundo
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            8.0), // Raio da borda
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (widget.course?.existsMatriculas ==
                                        true) {
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.info,
                                        title: 'Este curso tem matriculas!',
                                        text:
                                            'Favor verificar a pagina de alunos pra desmatricular alunos deste curso',
                                        confirmBtnText: 'OK',
                                        confirmBtnColor:
                                            VrColors.lightContainer,
                                        confirmBtnTextStyle:
                                            TextStyle(fontSize: 15),
                                      );
                                      return;
                                    } else {
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
                                        onConfirmBtnTap: () async {
                                          await controller
                                              .delete(widget.course!.codigo);

                                          QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.success,
                                            title: 'Curso deletado!',
                                            confirmBtnText: 'OK',
                                            confirmBtnColor: VrColors.primary,
                                            confirmBtnTextStyle:
                                                TextStyle(fontSize: 15),
                                          );

                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }
                                  },
                                  child: Text(
                                    'EXCLUIR CURSO',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : Container(),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (widget.course == null) {
                                if (descricao.text.length < 1) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Nome não pode ser vazio!',
                                    confirmBtnText: 'OK',
                                    confirmBtnColor: VrColors.lightContainer,
                                    confirmBtnTextStyle:
                                        TextStyle(fontSize: 15),
                                  );
                                  return;
                                }

                                if (ementa.text.length < 1) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    title: 'Ementa não pode ser vazio!',
                                    confirmBtnText: 'OK',
                                    confirmBtnColor: VrColors.lightContainer,
                                    confirmBtnTextStyle:
                                        TextStyle(fontSize: 15),
                                  );
                                  return;
                                }

                                await controller
                                    .add(AddCourseRequest(
                                      descricao: descricao.text,
                                      ementa: ementa.text,
                                    ))
                                    .whenComplete(() => Modular.to.pop());

                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  title: 'Aluno salvo!',
                                  confirmBtnText: 'OK',
                                  confirmBtnColor: VrColors.lightContainer,
                                  confirmBtnTextStyle: TextStyle(fontSize: 15),
                                );
                              } else {
                                await controller.update(
                                  UpdateCourseRequest(
                                      codigo: widget.course!.codigo.toString(),
                                      descricao: descricao.text,
                                      ementa: ementa.text),
                                );

                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  title: 'Curso alterado!',
                                  confirmBtnText: 'OK',
                                  confirmBtnColor: VrColors.lightContainer,
                                  confirmBtnTextStyle: TextStyle(fontSize: 15),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green,
                              ), // Cor de fundo
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Raio da borda
                                ),
                              ),
                            ),
                            child: Text(
                              'SALVAR CURSO',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    // Text(
                    //   'Alunos cadastrado',
                    //   style: VrSchoolUi.headline1,
                    // ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Voltar pra pagina anterior',
                          style: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
