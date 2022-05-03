import 'package:flutter/material.dart';
import 'package:master_flutter/pages/first_page.dart';
import 'package:master_flutter/pages/second_page.dart';

import 'main_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Flutter',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
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
