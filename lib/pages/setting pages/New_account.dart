import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class NewAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "New Account",
      bodyContent: Center(
        child: Text('Create a new account here.',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
