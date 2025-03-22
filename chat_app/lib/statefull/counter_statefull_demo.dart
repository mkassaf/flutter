import 'package:flutter/material.dart';

class CounterStatefull extends StatefulWidget {
  const CounterStatefull({super.key});

  @override
  State<CounterStatefull> createState() {
    return _CounterStatefullState();
  }
}

class _CounterStatefullState extends State<CounterStatefull> {
  int counter = 0;

  void incremntCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Counter')),
      body: Center(
        child: Text('Counter: $counter', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incremntCounter, // Calls method on button press
        child: Icon(Icons.add),
      ),
    );
  }
}
