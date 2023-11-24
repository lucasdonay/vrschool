// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_enrollment_request.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/add_student_request.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/student_response.dart';
import 'package:vrschool_mobile/app/features/students/infra/models/update_student_request.dart';
import 'package:vrschool_mobile/app/features/students/presenter/stores/enrollment_store.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';
import '../stores/student_store.dart';

class AddOrEditStudentPage extends StatefulWidget {
  AlunoResponse? student;
  AddOrEditStudentPage({super.key, this.student});

  @override
  State<AddOrEditStudentPage> createState() => _AddOrEditStudentPageState();
}

class _AddOrEditStudentPageState extends State<AddOrEditStudentPage> {
  final controller = Modular.get<AlunosStore>();
  final courseController = Modular.get<CoursesStore>();
  final enrollmentController = Modular.get<EnrollmentStore>();

  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  var cursoCodigoMatricula = 0;

  bool openModal = false;

  TextEditingController nomeEC = TextEditingController();
  TextEditingController cursoEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      nomeEC.text = widget.student!.nome;
      cursoEC.text = widget.student!.cursoDescricao;
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
                      widget.student != null ? 'Editar aluno' : 'Criar aluno',
                      style: isDarkMode
                          ? VrSchoolUi.headline1DarkMode
                          : VrSchoolUi.headline1,
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                      'Nome do aluno',
                      style: isDarkMode
                          ? VrSchoolUi.headline2DarkMode
                          : VrSchoolUi.headline2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: nomeEC,
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
                        hintText: 'Digite o nome do aluno aqui...',
                        hintStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                        labelStyle: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    if (widget.student != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Curso matriculado',
                            style: isDarkMode
                                ? VrSchoolUi.headline2DarkMode
                                : VrSchoolUi.headline2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: cursoEC,
                            readOnly: true,
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
                              hintText: '',
                              hintStyle: isDarkMode
                                  ? VrSchoolUi.headline3DarkMode
                                  : VrSchoolUi.headline3,
                              labelStyle: isDarkMode
                                  ? VrSchoolUi.headline3DarkMode
                                  : VrSchoolUi.headline3,
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.student != null &&
                            widget.student!.cursoDescricao !=
                                'NÃO ESTÁ MATRICULADO')
                          ElevatedButton(
                              onPressed: () {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.info,
                                  confirmBtnText: 'Sim',
                                  title:
                                      'Tem certeza que deseja desmatricular ?',
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
                                    print(widget.student!.cursoDescricao);
                                    enrollmentController.delete(
                                      AddEnrollmentRequest(
                                        codigoStudent: widget.student!.codigo,
                                      ),
                                    );

                                    cursoEC.text = "NÃO ESTÁ MATRICULADO";

                                    Modular.to.pop();

                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.success,
                                      title: 'Matricula desfeita!',
                                      titleColor: Colors.black,
                                      confirmBtnColor: VrColors.primary,
                                      confirmBtnText: 'OK',
                                      confirmBtnTextStyle:
                                          TextStyle(fontSize: 15, color: Colors.white),
                                    );
                                    print('foi');
                                  },
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.red,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Raio da borda
                                  ),
                                ),
                              ),
                              child: Text(
                                "Desmatricular",
                                style: VrSchoolUi.headline3
                                    .copyWith(color: Colors.white),
                              )),
                        if (widget.student != null &&
                            widget.student!.cursoDescricao ==
                                'NÃO ESTÁ MATRICULADO')
                          ElevatedButton(
                            onPressed: buildModalBottomSheet,
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
                              "Matricular",
                              style: VrSchoolUi.headline3
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (nomeEC.text.length < 1) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              title: 'Nome não pode ser vazio!',
                              confirmBtnText: 'OK',
                              confirmBtnColor: VrColors.primary,
                              confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                            );
                            return;
                          }

                          if (widget.student == null) {
                            await controller
                                .add(AddAlunoRequest(nome: nomeEC.text))
                                .whenComplete(() => Modular.to.pop());

                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              title: 'Aluno salvo!',
                              confirmBtnText: 'OK',
                              confirmBtnColor: VrColors.primary,
                              confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                            );
                          } else {
                            await controller
                                .update(UpdateAlunoRequest(
                                    id: widget.student!.codigo,
                                    name: nomeEC.text))
                                .whenComplete(() => Modular.to.pop());

                            if (openModal) {
                              enrollmentController.add(
                                AddEnrollmentRequest(
                                  codigoStudent: widget.student!.codigo,
                                  idCourse: cursoCodigoMatricula,
                                ),
                              );

                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                title: 'Aluno matriculado!',
                                confirmBtnText: 'OK',
                                confirmBtnColor: VrColors.primary,
                                confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                              );
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                title: 'Aluno alterado!',
                                confirmBtnText: 'OK',
                                confirmBtnColor: VrColors.primary,
                                confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green,
                          ), // Cor de fundo
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Raio da borda
                            ),
                          ),
                        ),
                        child: Text(
                          widget.student == null
                              ? 'Criar Aluno'
                              : 'Salvar Alteração',
                          style: VrSchoolUi.headline3
                              .copyWith(color: Colors.white),
                        ),
                      ),
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
                      const SizedBox(
                        height: 50,
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

  buildModalBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  'Escolher Curso',
                  style: VrSchoolUi.headline1,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courseController.coursesList.length,
                  itemBuilder: (context, index) {
                    return Observer(builder: (context) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              cursoEC.text =
                                  courseController.coursesList[index].descricao;
                              openModal = true;
                              cursoCodigoMatricula =
                                  courseController.coursesList[index].codigo;
                              Modular.to.pop();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              height: 50,
                              child: Center(
                                child: Text(
                                  courseController.coursesList[index].descricao,
                                  style: VrSchoolUi.headline2,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: VrColors.primary, // Cor do divisor
                            thickness: 1, // Espessura do divisor
                            height: 10.0, // Altura do espaço acima do divisor
                            indent: 40.0, // Recuo à esquerda do divisor
                            endIndent: 40.0, // Recuo à direita do divisor
                          ),
                        ],
                      );
                    });
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
