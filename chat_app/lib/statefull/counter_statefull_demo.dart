import 'package:chat_app/login_page.dart';
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
    //TODO: debug print statement to check if build is called
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Counter'),
        backgroundColor: appBar,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              //This logic will be used to navigate to the login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }, // Calls method on button press
          ),
        ],
      ),
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
}
