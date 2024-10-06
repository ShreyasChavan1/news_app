import 'package:flutter/material.dart';
import 'package:newsapp/firstpage/login.dart';

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
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
                'Email Verification',
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
                      'Enter OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Enter OTP Recieved on Registered Email',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 127, 126, 126),
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textbox("Enter New Password"),
                  SizedBox(
                    height: 20,
                  ),
                  textbox("Confirm New Password"),
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
                              return Login();
                            }));
                          },
                          child: Text('Change Password',
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

  Widget textbox(String hinttext) {
    return Container(
      height: 45,
      width: 350,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hinttext,
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
    );
  }
}
