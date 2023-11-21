import 'package:flutter/material.dart';
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
                    height: 45,
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
                    height: 50,
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
                      hintText: 'EMENTA DO CURSO',
                      hintStyle: VrSchoolUi.headline3,
                      labelStyle: VrSchoolUi.headline3,
                      prefixIconColor: VrColors.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text(
                    'Alunos cadastrado',
                    style: VrSchoolUi.headline1,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Text('OBSERVAÇÕES QUE IREI COLOCAR')
                ],
              ),
              Center(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          onConfirmBtnTap: () {
                            print('CONFIRMOU');
                            Navigator.pop(context);
                          },
                        );
                      },
                      child: Text(
                        'EXCLUIR CURSO',
                        style: VrSchoolUi.headline2.copyWith(color: Colors.red),
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
                        style: VrSchoolUi.headline2,
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
    );
  }
}
