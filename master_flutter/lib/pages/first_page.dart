import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State {
  double _currentSliderValue = 0.2;
  bool _currentCheckboxValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 4,
          child: Card(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Start typing...',
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                flex: 1,
                child: Card(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Switch(
                      value: _currentCheckboxValue,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            _currentCheckboxValue = value ?? true;
                          },
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Card(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FloatingActionButton(
                      child: const Icon(
                        Icons.add,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Checkbox(
                      value: _currentCheckboxValue,
                      onChanged: (bool? value) {
                        setState(() {
                          _currentCheckboxValue = value ?? true;
                        });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Card(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Button"),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Card(
            child: Slider(
              value: _currentSliderValue,
              onChanged: (double value) {
                setState(
                  () {
                    _currentSliderValue = value;
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
