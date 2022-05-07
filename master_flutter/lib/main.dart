import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:master_flutter/pages/first_page.dart';
import 'package:master_flutter/pages/second_page.dart';

import 'main_widget.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(const MasterFlutterApp());
}

class MasterFlutterApp extends StatelessWidget {
  const MasterFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key("dashboard"),
      title: 'Master Flutter',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.indigoAccent)),
      home: const MainWidget(),
      routes: <String, WidgetBuilder>{
        '/first': (BuildContext context) => const FirstPage(),
        '/second': (BuildContext context) => const SecondPage()
      },
    );
  }
}
