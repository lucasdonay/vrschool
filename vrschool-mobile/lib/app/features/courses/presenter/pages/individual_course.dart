import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';

class CursoIndividual extends StatelessWidget {
  const CursoIndividual({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações do curso',
                    style: VrSchoolUi.headline1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: null,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: VrColors.primary,
                        ), // Cor da borda ao focar
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'NOME DO CURSO',
                      hintStyle: VrSchoolUi.headline3,
                      labelStyle: VrSchoolUi.headline3,
                      prefixIconColor: VrColors.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: null,
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: VrColors.primary,
                        ), // Cor da borda ao focar
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'EMENTA DO CURSO',
                      hintStyle: VrSchoolUi.headline3,
                      labelStyle: VrSchoolUi.headline3,
                      prefixIconColor: VrColors.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.red,
                          ), // Cor de fundo
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8.0), // Raio da borda
                            ),
                          ),
                        ),
                        onPressed: () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.info,
                            confirmBtnText: 'Sim',
                            title: 'Tem certeza que deseja deletar o curso ?',
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
                                  confirmBtnTextStyle: TextStyle(fontSize: 15),
                                  onConfirmBtnTap: () {
                                    Modular.to.navigate('/base');
                                  });
                            },
                          );
                        },
                        child: Text(
                          'EXCLUIR CURSO',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
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
                        onPressed: () {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Curso salvo!',
                            confirmBtnText: 'OK',
                            confirmBtnColor: VrColors.lightContainer,
                            confirmBtnTextStyle: TextStyle(fontSize: 15),
                          );
                        },
                        child: Text(
                          'SALVAR CURSO',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Alunos cadastrado',
                    style: VrSchoolUi.headline1,
                  ),
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
                        style: VrSchoolUi.headline3,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
