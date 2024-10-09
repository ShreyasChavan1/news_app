import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/change_pass.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class ManagePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "Manage Password",
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title:
                Text('Change Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          ListTile(
            title:
                Text('Reset Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              // Add reset password functionality
            },
          ),
        ],
      ),
    );
  }
}
