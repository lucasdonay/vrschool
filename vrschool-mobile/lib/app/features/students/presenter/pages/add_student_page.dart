import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../core/ui/colors.dart';
import '../../../../core/ui/vrschool_ui.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  String selectedValue = 'SELECIONAR';

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
                    'Adicionar aluno',
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
                      hintText: 'NOME DO ALUNO',
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
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: VrColors.black.withOpacity(0.45), width: 1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DropdownButton<String>(
                          elevation: 4,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: <String>[
                            'SELECIONAR',
                            'Opção 2',
                            'Opção 3',
                            'Opção 4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Criar',
                        style: VrSchoolUi.headline2,
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
