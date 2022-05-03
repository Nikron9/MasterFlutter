import 'package:flutter/material.dart';
import 'package:master_flutter/pages/first_page.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Master Flutter")),
        body: const FirstPage(key: Key("FirstPage")));
  }
}
