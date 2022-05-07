import 'dart:math' as math;

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State with TickerProviderStateMixin {
  List<Widget> widgets = [];
  late AnimationController _controller;
  late AnimationController _controller2;

  var images = [
    "assets/images/android.png",
    "assets/images/flutter.png",
    "assets/images/react.png",
    "assets/images/xamarin.png"
  ];

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();

    _controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);

    for (int i = 0; i < 999; i++) {
      widgets.add(getRow(i));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        key: const Key("list"),
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: AnimatedBuilder(
          animation: () {
            if (i % 2 == 0) {
              return _controller;
            } else {
              return _controller2;
            }
          }(),
          builder: (_, child) {
            if (i % 2 == 0) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            } else {
              return Transform.scale(
                scale: _controller2.value * 1.5,
                child: child,
              );
            }
          },
          child: Padding(
              padding: const EdgeInsets.all(25),
              child: Image.asset(images[i % 4], width: 120, height: 120)),
        ),
      ),
    );
  }
}
