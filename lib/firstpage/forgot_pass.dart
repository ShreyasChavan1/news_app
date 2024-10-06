import 'package:flutter/material.dart';
import 'package:newsapp/firstpage/validation.dart';

class Forgot_pass extends StatefulWidget {
  const Forgot_pass({super.key});

  @override
  State<Forgot_pass> createState() => _Forgot_passState();
}

class _Forgot_passState extends State<Forgot_pass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              leading: BackButton(color: Colors.red),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Color.fromARGB(255, 240, 68, 68),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 90,
            ),

            //glass effect
            Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Email Address Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Enter the email Associated with your account',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 127, 126, 126),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 45,
                    width: 350,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Enter Registered Email",
                        filled: true,
                        fillColor: Color(0xFF291C1B),
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
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Container(
                      width: 180,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(34),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Validation();
                            }));
                          },
                          child: Text('Recover Password',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
