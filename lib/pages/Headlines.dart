import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/homepage/hompage.dart';
import 'package:newsapp/pages/saved.dart';
import 'package:newsapp/pages/settings.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HeadlinesPage extends StatefulWidget {
  @override
  _HeadlinesPageState createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage>
    with SingleTickerProviderStateMixin {
  int currenindex = 0;
  late TabController _tabController;
  String? stringResponse;
  late Map mapResponse;
  late Map dataResponse;
  List? listResponse;
  String APIKEY = "e9b3a6b9564f4c61998841c2307f451c";

  Future apicall(String apiurl) async {
    http.Response response;
    response = await http.get(Uri.parse(apiurl));
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    apicall(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-02-22&sortBy=publishedAt&apiKey=$APIKEY");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Homepage()));
      case 1: // Headlines
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HeadlinesPage()));
        setState(() {
          currenindex = index;
        });
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

  void _oncatTapped(int index) {
    String apiUrl;
    switch (index) {
      case 0:
        apiUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$APIKEY";
        break;
      case 1: // Business
        apiUrl =
            "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$APIKEY";
        break;
      case 2: // Entertainment
        apiUrl =
            "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=$APIKEY";
        break;
      case 3: // Gaming
        apiUrl =
            "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=$APIKEY";
        break;
      default:
        apiUrl = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=$APIKEY";
    }
    apicall(apiUrl);
    setState(() {
      currenindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        title: Text('Headlines', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        bottom: TabBar(
          labelColor: Colors.red,
          controller: _tabController,
          onTap: (index) {
            _oncatTapped(index);
          },
          tabs: [
            Tab(
              text: 'All',
            ),
            Tab(
              text: 'Business',
            ),
            Tab(
              text: 'Entertainment',
            ),
            Tab(
              text: 'Sports',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCategoryContent('All'),
          _buildCategoryContent('Business'),
          _buildCategoryContent('Entertainment'),
          _buildCategoryContent('Gaming'),
        ],
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

  Widget _buildCategoryContent(String category) {
    return ListView.builder(
      itemCount: listResponse?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          hoverColor: const Color.fromARGB(255, 52, 52, 52),
          subtitle: Text(
            listResponse![index]['author'] ?? '',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          title: Text(
            listResponse![index]['title'] ?? '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onTap: () async {
            // Get the URL from the response
            String? url = listResponse![index]['url'];

            // Check if the URL is not null and can be launched
            if (url != null && await canLaunch(url)) {
              await launch(url); // Launch the URL in a browser
            } else {
              print("Could not launch the URL");
            }
          },
          trailing: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(listResponse![index]['urlToImage'] ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
