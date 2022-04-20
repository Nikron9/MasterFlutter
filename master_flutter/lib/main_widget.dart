import 'package:flutter/material.dart';
import 'package:master_flutter/pages/first_page.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Master Flutter")), body: FirstPage());
  }
}
