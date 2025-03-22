import 'package:flutter/material.dart';

class CounterStatefull extends StatefulWidget {
  final Color buttonColor;

  const CounterStatefull({super.key, required this.buttonColor});

  @override
  State<CounterStatefull> createState() {
    return _CounterStatefullState(appBar: Colors.teal);
  }
}

class _CounterStatefullState extends State<CounterStatefull> {
  int counter = 0;

  Color appBar;

  _CounterStatefullState({required this.appBar});

  void incremntCounter() {
    if (mounted) {
      setState(() {
        print('Counter: $counter');
        counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateful Counter'), backgroundColor: appBar),
      body: Center(
        child: Text('Counter: $counter', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incremntCounter, // Calls method on button press
        child: Icon(Icons.add),
        backgroundColor: widget.buttonColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    print("We won't see this message, becasue this app has only one page");
  }

  @override
  void initState() {
    super.initState();
    print("CounterStatefull initState");
  }
}
