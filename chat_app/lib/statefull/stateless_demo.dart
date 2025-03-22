import 'package:flutter/material.dart';

/*
In this example, we have created a stateless widget that displays a text widget and a floating action button.
The text widget displays the number of times the floating action button is pressed.
The floating action button increments the counter each time it is pressed.
However, the counter is not updated in the UI because the widget is stateless. 
To update the UI, we need to use a stateful widget.

*/
class StatlessExmaple extends StatelessWidget {
  const StatlessExmaple({super.key});

  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Example'),
      ),
      body: Center(
        child: Text('You have pushed the button $_counter times.'),       
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button Pressed $_counter' );
          _counter++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}