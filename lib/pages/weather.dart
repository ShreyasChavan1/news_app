import 'package:flutter/material.dart';
import 'package:newsapp/pages/Headlines.dart';
import 'package:newsapp/pages/saved.dart';
import 'package:newsapp/pages/settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  int currenindex = 0;
  String weatherApiKey =
      "60867a9dff06428b98e143224231906"; // Replace with your actual Weather API key
  String unsplashAccessKey =
      "gscODY5fXnjg7sTV8OOa-v6vJEa3-m7E_40q1CFJydM"; // Replace with your actual Unsplash API key
  List<String> cities = [
    "London",
    "New York",
    "Tokyo",
    "Sydney",
    "Thane",
    "Mumbai"
  ];
  Map<String, dynamic> weatherData = {};
  Map<String, String> cityImages = {};

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    for (String city in cities) {
      // Fetch weather data
      var weatherResponse = await http.get(Uri.parse(
          "http://api.weatherapi.com/v1/current.json?key=$weatherApiKey&q=$city"));

      if (weatherResponse.statusCode == 200) {
        setState(() {
          weatherData[city] = json.decode(weatherResponse.body);
        });
      } else {
        print("Failed to load weather data for $city");
      }

      // Fetch city image from Unsplash
      var unsplashResponse = await http.get(Uri.parse(
          "https://api.unsplash.com/photos/random?query=$city&client_id=$unsplashAccessKey"));

      if (unsplashResponse.statusCode == 200) {
        var imageData = json.decode(unsplashResponse.body);
        setState(() {
          cityImages[city] = imageData['urls']['regular'];
        });
      } else {
        print("Failed to load image for $city");
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text('Weather', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        foregroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          String city = cities[index];
          var data = weatherData[city];
          String? cityImageUrl = cityImages[city];

          return data == null || cityImageUrl == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: EdgeInsets.all(15.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              city,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Image.network(
                                  "https:${data['current']['condition']['icon']}",
                                  width: 64,
                                  height: 64,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  data['current']['condition']['text'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Temperature: ${data['current']['temp_c']} °C",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Wind Speed: ${data['current']['wind_kph']} kph",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Humidity: ${data['current']['humidity']}%",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Pressure: ${data['current']['pressure_mb']} mb",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cityImageUrl,
                          width: 230,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
        },
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
        currentIndex: currenindex,
        onTap: _onItemTapped,
      ),
    );
  }
}
