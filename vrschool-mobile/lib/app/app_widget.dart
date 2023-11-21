import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/ui/vrschool_ui.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VRSCHOOL',
      color: Colors.black,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: VrSchoolUi.theme.textTheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme:
            const ColorScheme.light().copyWith(primary: Colors.deepOrange),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
