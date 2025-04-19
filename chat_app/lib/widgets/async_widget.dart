import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

class MyAsyncWidget extends StatefulWidget {
  @override
  _MyAsyncWidgetState createState() => _MyAsyncWidgetState();
}

class _MyAsyncWidgetState extends State<MyAsyncWidget> {
  String _data = 'Loading...';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Simulate a network call, this asynchronous operation which will not block the UI
  // will take some time to complete
  // and will update the state of the widget
  Future<void> _loadData() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 5));

    //TODO try without mounted
    if (!mounted) {
      print('Widget is not mounted, skipping state update.');
      return;
    }
    setState(() {
      _data = 'Data loaded successfully!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mounted Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              //This logic will redirect to login page
              // when the user clicks on the logout button
              // You can replace this with your actual logout logic
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(child: Text(_data)),
    );
  }
}
