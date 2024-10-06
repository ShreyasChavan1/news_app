import 'package:flutter/material.dart';
import 'package:newsapp/firstpage/login.dart';
import 'package:newsapp/homepage/hompage.dart';
import 'package:newsapp/pages/Headlines.dart';
import 'package:newsapp/pages/saved.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int currentIndex = 2;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homepage()));
      case 1: // Headlines
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HeadlinesPage()),
        );
        break;
      case 2:
        break;
      case 3: // Saved
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Saved()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 144,
              height: 162,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(94),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Shreyas chavan',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              'shreyas@gmail.com',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 30, 30),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  _buildSubOption('User Settings', Icons.settings),
                  _buildSubOption('General', Icons.settings),
                  _buildSubOption('New Account', Icons.add),
                  _buildDivider(),
                  ListTile(
                    title: Text(
                      'Security',
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                  _buildSubOption('Manage Password', Icons.security),
                  _buildSubOption('Change Password', Icons.lock),
                  _buildDivider(),
                  _buildSubOption('Privacy', Icons.privacy_tip),
                  _buildSubOption('Notifications', Icons.notifications),
                  _buildSubOption('About', Icons.info),
                  _buildDivider(),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.all(10.0)),
                      Icon(Icons.logout, color: Colors.red),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_rounded),
            label: 'For You',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3_rounded),
            label: 'Headlines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Saved',
          ),
        ],
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSubOption(String title, IconData icon) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      height: .5,
      child: Container(
        color: const Color.fromARGB(255, 103, 102, 102),
      ),
    );
  }
}
