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
    setState(() {
      counter++;
    });
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
    //TODO: debug print statement to check if dispose is called
    super.dispose();
  }

  @override
  void initState() {
    //TODO: debug print statement to check if initState is called
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CounterStatefull oldWidget) {
    //TODO: debug print statement to check if didUpdateWidget is called
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    //TODO: debug print statement to check if didChangeDependencies is called
    super.didChangeDependencies();
  }
}
