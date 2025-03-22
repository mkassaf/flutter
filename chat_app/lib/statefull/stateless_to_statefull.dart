import 'package:flutter/material.dart';
import 'dart:math';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _text = 'Hello World';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stateless to Stateful')),
      body: Center(child: Text(_text)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _text = 'Hello Flutter ${Random().nextInt(100)}';
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
