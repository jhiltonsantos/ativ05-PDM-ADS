import 'package:flutter/material.dart';

enum Operations { ADDITION, SUBTRACTION }

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int number = 0;

  int counterFunction(int number, Operations op) {
    if (op == Operations.ADDITION) {
      number++;
    } else if (number > 0) {
      number--;
    }
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '$number',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 140.0),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton(() {
                      setState(() {
                        number = counterFunction(number, Operations.ADDITION);
                      });
                    }, Icons.add, Colors.blueAccent),
                    buildButton(() {
                      setState(() {
                        number =
                            counterFunction(number, Operations.SUBTRACTION);
                      });
                    }, Icons.remove, Colors.redAccent),
                  ])
            ]),
      ),
    );
  }
}

buildButton(Function()? onPressed, IconData icon, Color color) {
  return RawMaterialButton(
    onPressed: onPressed,
    elevation: 2.0,
    fillColor: color,
    child: Icon(
      icon,
      size: 60.0,
    ),
    padding: const EdgeInsets.all(15.0),
    shape: const CircleBorder(),
  );
}
