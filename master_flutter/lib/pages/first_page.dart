import 'package:flutter/material.dart';
import 'package:master_flutter/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text("Next"),
        onPressed: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const SecondPage(),
                transitionDuration: const Duration(seconds: 0),
              ));
        },
      ),
    );
  }
}
