import 'package:flutter/material.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';

import '../../../../core/ui/vrschool_ui.dart';
import '../../../home/widgets/cards_aluno.dart';

class AlunosPage extends StatelessWidget {
  const AlunosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pesquisar Alunos',
                        style: VrSchoolUi.headline1,
                      ),
                      const SizedBox(
                        height: 15,
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
                          hintText: 'Digite o nome do aluno aqui...',
                          hintStyle: VrSchoolUi.headline3,
                          labelStyle: VrSchoolUi.headline3,
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: VrColors.primary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      CardsAluno(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
