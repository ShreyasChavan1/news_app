import 'package:flutter/material.dart';
import 'package:newsapp/homepage/hompage.dart';
import 'package:newsapp/pages/Headlines.dart';
import 'package:newsapp/pages/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  int currentIndex = 3;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homepage()));
      case 1: // Headlines
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HeadlinesPage(),
        ));
        break;
      case 2: // Settings
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Settings(),
        ));
        break;
      default:
        setState(() {
          currentIndex = index;
        });
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text('NewsStand', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        foregroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(13.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFF252525),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Saved Articles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Image.network(
                            'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAdVBMVEXMAQDMAADNCQjLAADTMjLYX17VTk7bV1bVTU3TOzvbWlnYQ0LQJibKAADrpKP/+vrhfHzwtbX////jhIT0z8/olpXkiYn21tbvuLj98fHecXHHAAD32dnXSkrcXFvRFxbxwcHaaGfRISH66entqqrqn5/SLy/s5ssvAAAA/UlEQVR4Ac3SBYKEMBAEwOl0cGY5Zt0V/v/ES87dZRuJFJpEXg9cOGL5UhHw9XwPv/5O3ia2Y4nbihP6JEmzPEkKgiironQE6jItc4gOmovW2mHTKv1oXPjJNFfUM5svAo6K5cAGy2K19PPpklzObE3NbAqRYqMaUHWx3dlQRbi3lbIMSDk4XCGwtaYkhMXctnqNgFxh6LSmogjro21uUOQW/T1mt4hrBNBYQgirueHpnaInm4SCCxspbxF6CgjBdnqMvzKae2piKyAYqtFxVDkIXdtl6XjXE4fTcbWPyML3vggo0Gq9XpOCQxG7JGoM5PnAn98Cw6sJ6F7P9hLc/hC1BcMqjgAAAABJRU5ErkJggg==',
                          ),
                        ),
                        Container(
                          child: Text(
                            'The Times Of India',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Times New Roman'),
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Image.network(
                        'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape',
                        cacheHeight: 100,
                      ),
                      title: Text(
                        'FULL MATCH: Becky Lynch vs. Nia Jax - Last Woman Standing Match: Raw, March 18, 2024',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 100, 98, 98),
                      thickness: 1,
                      height: 30,
                    ),
                    ListTile(
                      leading: Image.network(
                          'https://source.unsplash.com/random/1920x1080/?wallpaper,landscape'),
                      title: Text(
                        'Whats Behind the Bitcoin Price Surge? Vibes, Mostly',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: const Color.fromARGB(255, 100, 98, 98),
                thickness: 1,
                height: 30,
              ),
              const Text(
                'Sources',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.ndtv.com/');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 40.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC79hx7k06uUoeJsF698RnjfX1DW74tSjg0A&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.bbc.com/news');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 20.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQcJRVwk8Xq5AfmJpADAeQEzE1zeTvt7irVDw&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.timesnownews.com/');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 20.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRUompGnWbOR_f9UJKoyFCX2SHcnyWeM8tCA&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.cnbctv18.com/');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 20.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJ4tf21et_DOV6aSkKwZH5U4XtUVtNpyQDA&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://www.aajtak.in/');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 20.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE77qQvdVmiRfaNHIvq7-Zw6EdniW_mQFk3A&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL('https://edition.cnn.com/');
                    },
                    child: Container(
                      height: 90,
                      width: 120,
                      margin: EdgeInsets.only(
                          left: 20.0, right: 10.0, bottom: 20.0, top: 20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbrIgEa-rSYakFs_4AhgiSVypJ89EL5FSgYg&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 5.0, right: 15.0, left: 15.0, bottom: 15.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 51, 50, 50),
                    hintText: "Search More Sources",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 117, 115, 114),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: const Color.fromARGB(255, 38, 38, 38)),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
        ],
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
