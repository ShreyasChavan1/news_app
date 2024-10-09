import 'package:flutter/material.dart';
import 'package:newsapp/pages/setting%20pages/Manage_pass.dart';
import 'package:newsapp/pages/setting%20pages/New_account.dart';
import 'package:newsapp/pages/setting%20pages/about.dart';
import 'package:newsapp/pages/setting%20pages/change_pass.dart';
import 'package:newsapp/pages/setting%20pages/privacy.dart';
import 'package:newsapp/pages/setting%20pages/setting_temp.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: "User Settings",
      bodyContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('New Account', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewAccount()));
            },
          ),
          ListTile(
            title:
                Text('Manage Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ManagePassword()));
            },
          ),
          ListTile(
            title:
                Text('Change Password', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          ListTile(
            title: Text('Privacy', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PrivacyPage()));
            },
          ),
          ListTile(
            title: Text('About', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}
