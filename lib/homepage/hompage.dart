import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/pages/Headlines.dart';
import 'package:newsapp/pages/saved.dart';
import 'package:newsapp/pages/settings.dart';
import 'package:newsapp/pages/weather.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

late Map mapResponse;
late Map dataResponse;
List? listResponse;
String APIKEY = "e9b3a6b9564f4c61998841c2307f451c";

class _HomepageState extends State<Homepage> {
  int currenindex = 0;
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$APIKEY"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['articles'];
      });
    } else {
      print("API call failed with status code: ${response.statusCode}");
    }
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 1: // Headlines
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HeadlinesPage()));
        break;
      case 2: // Settings
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Settings()));
        break;
      case 3: // Saved
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Saved()));
        break;
      default:
        setState(() {
          currenindex = index;
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
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text('Trend Stream')),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: BackButton(color: Color.fromARGB(255, 255, 39, 39)),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0), // Set the desired margin
            child: IconButton(
              icon: Icon(Icons.wb_sunny),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Weather()));
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listResponse?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 33, 33),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: 450,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          listResponse![index]['urlToImage'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  listResponse![index]['publishedAt'] ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  listResponse![index]['title'] ?? '',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  listResponse![index]['description'] ?? '',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(listResponse![index]['url'] ?? '');
                  },
                  child: Text(
                    listResponse![index]['url'] ?? '',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
        unselectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
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
        currentIndex: currenindex,
        onTap: _onItemTapped,
      ),
    );
  }
}
