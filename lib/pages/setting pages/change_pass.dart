import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Change Password",
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Current Password',
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'New Password',
              labelStyle: TextStyle(color: Colors.white),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Change password logic
            },
            child: Text('Change Password'),
          ),
        ],
      ),
    );
  }
}
