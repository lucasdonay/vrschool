// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';

class CustomTileStudents extends StatefulWidget {
  int id;
  String name;
  String subtitle;
  void Function() edit;
  void Function() delete;
  CustomTileStudents({
    super.key,
    required this.id,
    required this.name,
    required this.subtitle,
    required this.edit,
    required this.delete,
  });

  @override
  _CustomTileStudents createState() => _CustomTileStudents();
}

class _CustomTileStudents extends State<CustomTileStudents> {
  bool isDarkMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: isDarkMode ? VrColors.darkContainer : VrColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Color.fromARGB(255, 43, 42, 42)
                      .withOpacity(0.4) // Cor personalizada para o tema escuro
                  : Colors.grey.withOpacity(0.2),
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
                        'NOME ALUNO',
                        style: isDarkMode
                            ? VrSchoolUi.headline2DarkMode
                            : VrSchoolUi.headline2,
                      ),
                      Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'NOME DO CURSO',
                        style: isDarkMode
                            ? VrSchoolUi.headline2DarkMode
                            : VrSchoolUi.headline2,
                      ),
                      Text(
                        widget.subtitle,
                        style: isDarkMode
                            ? VrSchoolUi.headline3DarkMode
                            : VrSchoolUi.headline3,
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
                      onPressed: widget.edit,
                      icon: Icon(
                        Icons.edit,
                        size: 20,
                        color: VrColors.primary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print(widget.subtitle);
                        if (widget.subtitle != 'NÃO ESTÁ MATRICULADO' &&
                            widget.subtitle != '') {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.info,
                            title: 'Aluno está matriculado!',
                            text:
                                "Para desmatricular, favor editar o aluno e excluir a matricula.",
                            confirmBtnText: 'OK',
                            confirmBtnColor: VrColors.primary,
                            confirmBtnTextStyle: TextStyle(fontSize: 15, color: Colors.white),
                          );
                        } else {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.info,
                            confirmBtnText: 'Sim',
                            title: 'Tem certeza que deseja deletar o aluno ?',
                            cancelBtnText: 'Não',
                            showConfirmBtn: true,
                            showCancelBtn: true,
                            confirmBtnColor: VrColors.primary,
                            cancelBtnTextStyle: TextStyle(
                              color: VrColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            onConfirmBtnTap: widget.delete,
                            onCancelBtnTap: () {
                              Modular.to.pop();
                            },
                          );
                        }
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
  }
}
