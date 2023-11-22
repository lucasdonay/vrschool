import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/stores/courses_store.dart';
import 'package:vrschool_mobile/app/features/courses/presenter/widgets/cards_courses.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({super.key});

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  final controller = Modular.get<CoursesStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pesquisar cursos',
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
                        hintText: 'Digite o nome do curso aqui...',
                        hintStyle: VrSchoolUi.headline3,
                        labelStyle: VrSchoolUi.headline3,
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: VrColors.primary,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: Observer(builder: (context) {
                        return CardsCursos();
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
