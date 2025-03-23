import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isButtonEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Let\'s sign you in!',
              style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome back!\n You've been missed!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Image.network("https://shorturl.at/RqyFD", height: 200),

            SizedBox(
              width: double.infinity, // Full width
              child: ElevatedButton(
                onPressed:
                    isButtonEnabled ? () => print('Login Successful') : null,
                child: Text(
                  'Click Me',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            OutlinedButton(
              onPressed: () {},
              child: FlutterLogo(), // Using a logo instead of text
            ),

            TextButton(onPressed: () {}, child: Text('Go to Website')),
          ],
        ),
      ),
    );
  }
}
