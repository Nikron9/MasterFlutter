import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: ElevatedButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
      ),
    );
  }
}