import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';
import 'package:vrschool_mobile/app/features/students/presenter/stores/student_store.dart';

import '../../../../core/ui/vrschool_ui.dart';
import '../widgets/cards_student.dart';

class AlunosPage extends StatefulWidget {
  const AlunosPage({super.key});

  @override
  State<AlunosPage> createState() => _AlunosPageState();
}

class _AlunosPageState extends State<AlunosPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              children: [
                Column(
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
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: Observer(builder: (context) {
                          return CardsAluno();
                        }),
                      ),
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
