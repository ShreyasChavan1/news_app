import 'package:newsapp/firstpage/forgot_pass.dart';
import 'package:newsapp/nextpage/registration.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/homepage/hompage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60.0),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF450202),
              Color(0xE6FF0909),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/logo.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabel('Username', 28),
                ],
              ),
              _buildTextField(
                'Enter your username',
                controller: usernameController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildLabel('Password', 28),
                ],
              ),
              _buildTextField(
                'Enter your password',
                isPassword: true,
                controller: passwordController,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildForgotPassword(),
                ],
              ),
              SizedBox(height: 20),
              _buildSignInButton(),
              SizedBox(height: 10),
              _buildSignUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTextField(
    String hintText, {
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFF291C1B),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF794F3F),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Forgot_pass()));
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              String enteredUsername = usernameController.text;
              String enteredPassword = passwordController.text;

              String predefinedUsername = "shreyas";
              String predefinedPassword = "2004";
              if (enteredUsername == predefinedUsername &&
                  enteredPassword == predefinedPassword) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Homepage();
                  }),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Incorrect username or password.'),
                  ),
                );
              }
            },
            child: Text('Sign In',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return Second();
        }));
      },
      child: Text(
        "Don't have an account? Sign up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Times New Roman',
        ),
      ),
    );
  }
}
