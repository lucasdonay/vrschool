import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrschool_mobile/app/core/ui/colors.dart';
import 'package:vrschool_mobile/app/core/ui/vrschool_ui.dart';
import 'package:vrschool_mobile/app/features/home/stores/home_page_controller.dart';
import 'package:vrschool_mobile/app/features/navigation/navigation_controller.dart';

import '../alunos/presenter/pages/alunos_page.dart';
import '../cursos/presenter/pages/cursos_page.dart';
import '../home/pages/home_page.dart';

class NavigationPages extends StatefulWidget {
  const NavigationPages({Key? key}) : super(key: key);

  @override
  State<NavigationPages> createState() => _NavigationPagesState();
}

class _NavigationPagesState extends State<NavigationPages> {
  final globalController = NavigationController();

  List<Widget> pages = [
    const HomePage(),
    const AlunosPage(),
    const CursosPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return pages[_currentIndex];
        },
      ),
      bottomNavigationBar: Observer(
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              color: VrColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_2_rounded,
                  ),
                  label: 'Alunos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_book_rounded,
                  ),
                  label: 'Cursos',
                ),
              ],
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              elevation: 0,
              backgroundColor: VrColors.transparent,
              selectedItemColor: VrColors.white,
              unselectedItemColor: VrColors.withOpacity,
            ),
          );
        },
      ),
    );
  }
}
