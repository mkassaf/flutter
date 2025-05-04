import 'package:chat_app/utils/brand_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:chat_app/utils/spaces.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isButtonEnabled = false;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> registerFireBase(
    TextEditingController userName,
    TextEditingController password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: userName.text,
            password: password.text,
          );
      return true;
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code, e.message!);
    }
    return false;
  }

  void showErrorMessage(String title, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void createUser() async {
    if (_formKey.currentContext != null && _formKey.currentState!.validate()) {
      bool isValid = await registerFireBase(
        userNameController,
        passwordController,
      );
      if (!isValid) {
        print("Sign failed");
        return;
      }
      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
      );
      print("Login successful");
    } else {
      // Validation failed, show error messages
      print("Login failed");
    }
  }

  Widget _buildHeader(context) {
    return Column(
      children: [
        Text(
          'Create your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Please enter your details below',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              // Username field
              LoginTextField(
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value!.length < 5) {
                    return 'Username must be at least 5 characters long';
                  }
                  return null;
                },
                controller: userNameController,
                hintText: "Add your username",
              ),
              verticalSpacing(24),
              // Password field
              LoginTextField(
                controller: passwordController,
                hasAsterisks: true,
                hintText: "Type your password",
              ),
            ],
          ),
        ),
        verticalSpacing(24), // Adds space between form fields and buttons

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              // Check if the button is pressed or hovered
              if (states.contains(WidgetState.pressed)) {
                return Colors.blue; // Color when pressed
              } else if (states.contains(WidgetState.hovered)) {
                return Colors.green; // Color when hovered
              } else if (states.contains(WidgetState.disabled)) {
                return Colors.grey; // Color when disabled
              }
              return BrandColors.primary; // Default color
            }),
          ),
          onPressed: createUser,
          child: Text(
            'Sign up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign up"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                if (constraints.maxWidth > 1000) {
                  return Row(
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                        child: Column(children: [_buildHeader(context)]),
                      ),
                      Spacer(flex: 1),
                      Expanded(child: _buildForm()),
                      Spacer(flex: 1),
                    ],
                  );
                }
                return Column(children: [_buildHeader(context), _buildForm()]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
