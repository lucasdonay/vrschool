import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../../../core/ui/colors.dart';
import '../../../core/ui/vrschool_ui.dart';

class CardsAluno extends StatelessWidget {
  const CardsAluno({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              color: VrColors.lightGrey,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
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
                            'NOME DO ALUNO',
                            style: VrSchoolUi.headline2,
                          ),
                          Text(
                            'Lucas Donay',
                            overflow: TextOverflow.ellipsis,
                            style: VrSchoolUi.headline3,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'NOME DO CURSO',
                            style: VrSchoolUi.headline2,
                          ),
                          Text(
                            'Engenharia',
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
                          onPressed: () {},
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
  }
}
