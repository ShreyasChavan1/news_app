import 'package:flutter/material.dart';
import 'package:newsapp/firstpage/login.dart';
// import 'package:newsapp/nextpage/data.dart';
// import 'package:newsapp/nextpage/db_helper.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:flutter/foundation.dart';
import '../main.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  // DBhelper? dbHelper;
  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                leading: BackButton(color: Colors.red),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(height: 23),
              Row(
                children: [
                  _buildLabel('Username', 24),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 8),
              _buildTextField('Enter your username'),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildLabel('Password', 24),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 8),
              _buildTextField('Enter your password', isPassword: true),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildLabel('Phone No', 24),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 8),
              _buildTextField('Enter your phone number'),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildLabel('Email', 24),
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              SizedBox(height: 8),
              _buildTextField('Enter your email'),
              SizedBox(height: 20),
              _buildRegisterButton(context),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 2,
                    color: Colors.red,
                    width: 190,
                  ),
                  Text(
                    '  Or login with  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.red,
                    width: 190,
                  ),
                ],
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo('../images/facebook.png'),
                  SizedBox(width: 20),
                  _buildLogo('../images/insta.png'),
                  SizedBox(width: 20),
                  _buildLogo('../images/twitter.png'),
                ],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff000000),
              Color(0xff6B0000),
              Color.fromARGB(255, 254, 10, 10),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, double fontSize) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText, {bool isPassword = false}) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
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
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
        child: Container(
      width: 150,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: TextButton(
          child: Text('Register',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Login();
            }));
          },
        ),
      ),
    ));
  }

  Widget _buildLogo(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
